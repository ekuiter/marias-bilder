class ChangeStringToText < ActiveRecord::Migration
  def change
    change_column :images, :description, :text
    change_column :categories, :description, :text
    change_column :sub_categories, :description, :text
  end
end
