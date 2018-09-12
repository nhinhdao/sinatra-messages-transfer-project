class User < ActiveRecord::Base
  has_many :messages
  has_many :friendships
  has_many :friends, through: :friendships
  has_secure_password
  validates :username, presence: true
  validates :email, uniqueness: true
end
