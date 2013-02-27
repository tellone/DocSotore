class User < ActiveRecord::Base
  has_many :documents
  attr_accessible :email, :password
  validates :email, :password, presence: true
  validates :password, presence: true
end
