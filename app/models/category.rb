class Category < ActiveRecord::Base
  
  has_many :sub_categories, dependent: :destroy
  has_many :images, through: :sub_categories
  
  validates :title, presence: true, uniqueness: true
  validates :order, numericality: { only_integer: true }
  
  def url
     Rails.application.routes.url_helpers.show_category_path \
       category: id,
       seo_category: title.urlify
  end
  
end
