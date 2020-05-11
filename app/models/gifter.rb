class Gifter < ApplicationRecord
  has_many :giftees
  belongs_to :user
  has_many :presents
  belongs_to :occasion
end
