class Present < ApplicationRecord
  has_one :gifter
  has_one :giftee
end
