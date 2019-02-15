class Reservation < ApplicationRecord
  belongs_to :user
  has_one :lunch_box
end
