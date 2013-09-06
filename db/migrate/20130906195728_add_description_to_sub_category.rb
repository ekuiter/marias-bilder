class AddDescriptionToSubCategory < ActiveRecord::Migration
  def change
    add_column :sub_categories, :description, :string
  end
end
