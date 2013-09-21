class AddOrderToImages < ActiveRecord::Migration
  def change
    add_column :images, :order, :integer, null: :false, default: 0
  end
end
