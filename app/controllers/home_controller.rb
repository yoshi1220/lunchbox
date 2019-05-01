class HomeController < ApplicationController
  before_action :require_login

  def index
    @reservations = Reservation.where(user_id: current_user.id)
                               .where('reservation_date >= ?', Date.today)
                               .order(:reservation_date)

    @amount_per_months = ReservationService.sum_up_per_month(current_user.id)
  end
end
