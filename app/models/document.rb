class Document < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title
  validate :title, :presence => true, :length => {:minmium =>5}
end
