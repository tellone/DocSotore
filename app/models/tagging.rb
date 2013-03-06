class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :document
  # attr_accessible :title, :body
end
