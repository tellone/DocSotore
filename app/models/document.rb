class Document < ActiveRecord::Base
  belongs_to :user
  # has_many :taggings
  # has_many :tags, through: :taggings

  acts_as_taggable
  attr_accessible :user_id, :title, :tag_list, :doc_file, :open
  validates_presence_of :title
  has_attached_file :doc_file
  # validates_attachment_content_type :doc_file, :content_type => ['application/pdf', 'application/msword', 'text/plain']
  # validates_attachment_presence :doc_file

end
