module ReservationService
  module_function

  def reservation_exists(user_id, reservation_date)
    Reservation.where(user_id: current_user.id)
               .where('reservation_date = ?', Date.today)
  end
end
