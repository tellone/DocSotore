class User < ActiveRecord::Base
  attr_accessible :email, :password

  validates_presence_of :email, :password
end
