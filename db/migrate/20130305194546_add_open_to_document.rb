class AddOpenToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :open, :boolean, :default => false, :null => false
  end
end
