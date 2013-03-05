class Document < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable  
  attr_accessible :user_id, :title, :tag_list, :doc_file, :protected
  validates_presence_of :title
  has_attached_file :doc_file
  validates_attachment_content_type :doc_file, :content_type => ['application/pdf', 'application/msword', 'text/plain']


  def read_doc
  
    if protected?
      doc_file.copy_to_local_file
    end

  end
    
end
