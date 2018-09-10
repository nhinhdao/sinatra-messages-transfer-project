class User < ActiveRecord::Base
  has_many :messages
  has_many :friends
  has_secure_password
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 8, too_short: 'password has to be at least 8 characters'}
end
