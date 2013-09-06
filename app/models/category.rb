class Category < ActiveRecord::Base
  
  has_many :sub_categories, dependent: :destroy
  
  validates :title, presence: true, uniqueness: true
  validates :order, numericality: { only_integer: true }
  
end
