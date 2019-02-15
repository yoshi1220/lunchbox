class HomeController < ApplicationController
  def index
    @reservations = Reservation.all # ログインを実装するまで便宜的に1とする
  end
end
