class Giftee < ApplicationRecord
  belongs_to :user
  belongs_to :gifter, optional: true
  has_many :presents
  belongs_to :occasion
end
