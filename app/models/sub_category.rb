class SubCategory < ActiveRecord::Base

  has_many :images, dependent: :destroy
  belongs_to :category
  
  validates :title, :category, presence: true
  validates :order, numericality: { only_integer: true }

end
