module ReservationService
  module_function

  def reservation_exists(reservation)
    Reservation.where(user_id: reservation.user_id)
               .where('reservation_date = ?', reservation.reservation_date)
               .first
  end

  def is_past_date(reservation_date)
    reservation_date < Date.today
  end
end
