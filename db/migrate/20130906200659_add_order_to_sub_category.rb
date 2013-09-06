class AddOrderToSubCategory < ActiveRecord::Migration
  def change
    add_column :sub_categories, :order, :integer
  end
end
