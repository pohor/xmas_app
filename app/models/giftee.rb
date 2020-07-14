class Giftee < ApplicationRecord
  belongs_to :user
  belongs_to :gifter, optional: true
  has_many :presents
  belongs_to :occasion

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :user_id, presence: true
end
