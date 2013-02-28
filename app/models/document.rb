class Document < ActiveRecord::Base
  belongs_to :user
  has_attached_file :doc_file

  acts_as_taggable  
  attr_accessible :title, :taglist
  validates_presence_of :title
  validates :doc_file, :attachment_presence => true

end
