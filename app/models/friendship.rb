# check again if its better to have Friend class or just use :class_name :user
class Friendship < ActiveRecord::Base
  # has_many :messages
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
