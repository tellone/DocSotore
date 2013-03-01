class User < ActiveRecord::Base
  after_initialize :init
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :admin, :password_confirmation, :remember_me
  
  validates_presence_of :email, :password
  validates_uniqueness_of :email
  
  has_many :documents
  
  acts_as_tagger

  private     
  def init
    self.admin = false if self.admin.nil? 
  end
  # attr_accessible :title, :body
end
