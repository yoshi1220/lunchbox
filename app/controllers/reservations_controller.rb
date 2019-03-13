class ReservationsController < ApplicationController
  before_action :require_login

  def new
    @reservation = Reservation.new
    @lunch_boxes = LunchBox.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.reserved = true
    if @reservation.save
      flash[:success] = 'お弁当の予約が完了しました。'
      redirect_to :root
    else
      render 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :lunch_box_id)
  end
end
