class User < ActiveRecord::Base
  attr_accessible :email, :password

  validates :email, :password, presence: true
  validates :password, presence: true
end
