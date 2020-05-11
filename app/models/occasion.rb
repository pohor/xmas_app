class Occasion < ApplicationRecord
  has_many :giftees
  has_many :gifters
end
