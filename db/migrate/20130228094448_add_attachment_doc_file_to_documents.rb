class AddAttachmentDocFileToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :doc_file
    end
  end

  def self.down
    drop_attached_file :documents, :doc_file
  end
end
