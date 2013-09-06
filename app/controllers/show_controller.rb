class ShowController < ApplicationController

  before_filter :admin_required

  def latest
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

end
