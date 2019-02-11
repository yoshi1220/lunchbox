class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @lunch_boxes = LunchBox.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = 1
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
