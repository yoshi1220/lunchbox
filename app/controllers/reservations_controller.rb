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

    if ReservationService.is_past_date(@reservation.reservation_date)
      flash[:danger] = '過去の日付は予約できません。'
      @lunch_boxes = LunchBox.all
      render 'new'
      return
    end

    if ReservationService.reservation_exists(@reservation)
      flash[:danger] = 'すでに予約済みです。'
      @lunch_boxes = LunchBox.all
      render 'new'
      return
    end

    if @reservation.save
      flash[:success] = 'お弁当の予約が完了しました。'
      redirect_to :root
    else
      flash[:danger] = '予約に失敗しました。'
      @lunch_boxes = LunchBox.all
      render 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :lunch_box_id)
  end
end
