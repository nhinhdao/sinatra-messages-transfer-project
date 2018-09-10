#check again if its better to have Friend class or just use :class_name :user
class Friend < ActiveRecord::Base
   has_many :messages
end
