class AddFieldsToImages < ActiveRecord::Migration
  def change
    add_column :images, :title, :string
    add_column :images, :description, :string
    add_column :images, :file, :string
  end
end
