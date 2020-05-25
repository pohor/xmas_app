class Present < ApplicationRecord
  has_one :gifter
  belongs_to :giftee
end
