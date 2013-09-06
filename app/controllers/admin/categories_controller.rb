class Admin::CategoriesController < ApplicationController

  before_filter :admin_required
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_categories_path, notice: 'Bereich wurde erfolgreich hinzugefügt.'
    else
      render action: 'new'
    end
  end
  
  def edit
    @category = Category.find params[:id]
  end
  
  def update
    @category = Category.find params[:id]

    if @category.update_attributes category_params
      redirect_to admin_categories_path, notice: 'Bereich wurde erfolgreich verändert.'
    else
      render action: "edit"
    end
  end
  
  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to admin_categories_path, notice: 'Bereich wurde erfolgreich gelöscht.'
  end
  
  private

  def category_params
    params.require(:category).permit(:title)
  end
  

end
