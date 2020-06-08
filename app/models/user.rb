class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # As a user, I can "admin" the giftees that will not register into the app
  has_many :giftees
  # As a user, I can only "admin" one gifter FOR AN OCCASION (myself)
  has_many :gifters
end
