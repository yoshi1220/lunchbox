class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @lunch_boxes = LunchBox.all
  end
end
