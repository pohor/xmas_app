class Present < ApplicationRecord
  has_one :gifter
  belongs_to :giftee, optional: true

  validates :link, presence: true
  validates :name, presence: true

end
