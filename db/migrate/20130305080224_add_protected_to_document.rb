class AddProtectedToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :protected, :boolean, :default => true
  end
end
