class RemoveFileFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :file
  end
end
