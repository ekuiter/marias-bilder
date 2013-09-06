class Admin::SubCategoriesController < ApplicationController

  before_filter :admin_required
  
  def index
    @sub_categories = SubCategory.all
  end
  
  def new
    @sub_category = SubCategory.new
    @categories = Category.all
  end
  
  def create
    @sub_category = SubCategory.new sub_category_params
    @categories = Category.all
    if @sub_category.save
      redirect_to admin_sub_categories_path, notice: 'Kategorie wurde erfolgreich hinzugefügt.'
    else
      render action: 'new'
    end
  end
  
  def edit
    @sub_category = SubCategory.find params[:id]
    @categories = Category.all
  end
  
  def update
    @sub_category = SubCategory.find params[:id]

    if @sub_category.update_attributes sub_category_params
      redirect_to admin_sub_categories_path, notice: 'Kategorie wurde erfolgreich verändert.'
    else
      render action: "edit"
    end
  end
  
  def destroy
    @sub_category = SubCategory.find params[:id]
    @sub_category.destroy
    redirect_to admin_sub_categories_path, notice: 'Kategorie wurde erfolgreich gelöscht.'
  end
  
  private

  def sub_category_params
    params.require(:sub_category).permit(:title, :category_id)
  end
  

end
