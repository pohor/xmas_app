class Present < ApplicationRecord
  has_one :gifter
  has_one :giftee
  has_one :user
end
