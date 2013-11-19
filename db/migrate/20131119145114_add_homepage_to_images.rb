class AddHomepageToImages < ActiveRecord::Migration
  def change
    add_column :images, :homepage, :integer
  end
end
