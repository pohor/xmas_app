class Gifter < ApplicationRecord
  has_many :giftees
  belongs_to :user
  has_many :presents
  belongs_to :occasion

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
end
