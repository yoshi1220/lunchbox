class HomeController < ApplicationController
  before_action :require_login

  def index
    @reservations = Reservation.where(user_id: current_user.id)
                               .where('reservation_date >= ?', Date.today)
  end
end
