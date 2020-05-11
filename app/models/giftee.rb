class Giftee < ApplicationRecord
  belongs_to :user
  has_one :gifter
  has_many :presents
  belongs_to :occasion
end
