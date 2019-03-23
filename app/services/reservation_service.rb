module ReservationService
  module_function

  # 当日の予約が存在しないかチェック
  def reservation_exists(reservation)
    Reservation.where(user_id: reservation.user_id)
               .where('reservation_date = ?', reservation.reservation_date)
               .first
  end

  # 過去日付の予約かチェック
  def is_past_date(reservation_date)
    reservation_date < Date.today
  end
end
