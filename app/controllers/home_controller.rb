class HomeController < ApplicationController
  before_action :require_login

  def index
    @reservations = Reservation.where('reservation_date >= ?', Date.today) # ログインを実装するまで便宜的に1とする
  end
end
