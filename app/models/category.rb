class Category < ActiveRecord::Base
  
  has_many :sub_categories, dependent: :destroy
  
  validates :title, presence: true, uniqueness: true
  
end
