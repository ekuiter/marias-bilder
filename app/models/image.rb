class Image < ActiveRecord::Base
  
  belongs_to :sub_category
  
  validates :title, :file, :sub_category, presence: true
  validates :file, uniqueness: true
  
end
