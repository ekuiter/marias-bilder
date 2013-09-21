class Image < ActiveRecord::Base
  
  belongs_to :sub_category
  
  validates :title, :sub_category, presence: true
  
  def thumb
    "http://marias-bilder.de/images/#{id}s.jpg"
  end
  
  def large
    "http://marias-bilder.de/images/#{id}l.jpg"
  end
  
  def url
     Rails.application.routes.url_helpers.show_image_path \
       category: sub_category.category.id,
       seo_category: sub_category.category.title.urlify,
       sub_category: sub_category.id,
       seo_sub_category: sub_category.title.urlify,
       image: id,
       seo_image: title.urlify
  end
  
  def previous
    array = sub_category.images.order(:order)
    hash = Hash[array.map.with_index.to_a]
    index = hash[self]
    return nil if index == 0
    array[index - 1]
  end
  
  def next
    array = sub_category.images.order(:order)
    hash = Hash[array.map.with_index.to_a]
    index = hash[self]
    return nil if index > hash.values.max
    array[index + 1]
  end
  
end
