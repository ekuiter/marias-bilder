class ShowController < ApplicationController

  def latest
    @images = Image.latest
  end

  def category
    @current_category = Category.find params[:category]
    @nav_sub_categories = @current_category.sub_categories
  end
  
  def sub_category
    @current_category = Category.find params[:category]
    @nav_sub_categories = @current_category.sub_categories
    @current_sub_category = SubCategory.find params[:sub_category]
  end
  
  def image
    @current_category = Category.find params[:category]
    @nav_sub_categories = @current_category.sub_categories
    @current_sub_category = SubCategory.find params[:sub_category]
    @image = Image.find params[:image]
  end

end
