class HomeController < ApplicationController
  def index
    @reservations = Reservation.where('reservation_date >= ?', Date.today) # ログインを実装するまで便宜的に1とする
  end
end
