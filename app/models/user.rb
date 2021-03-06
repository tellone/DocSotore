class User < ActiveRecord::Base
  after_initialize :init
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :admin, :approved, :password_confirmation, :remember_me
  
  validates_presence_of :email, :password
  validates_uniqueness_of :email
  
  has_many :documents
  
  acts_as_tagger

def active_for_authentication? 
  super && approved? 
end 

def inactive_message 
  if !approved? 
    :not_approved 
  else 
    super # Use whatever other message 
  end 
end

  private     
  def init
    self.admin = false if self.admin.nil? 
  end
  # attr_accessible :title, :body
end
