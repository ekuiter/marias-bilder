class ChangeOrderInSubCategoryAndCategory < ActiveRecord::Migration
  def change
    change_column :categories, :order, :integer, null: :false, default: 0
    change_column :sub_categories, :order, :integer, null: :false, default: 0
  end
end
