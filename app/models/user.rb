class User < ApplicationRecord
  has_many :reservations
  acts_as_authentic
end
