class Admin::CategoriesController < ApplicationController

  before_filter :admin_required
  
  def index
    @categories = Category.order :order
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
  
  def order
    params[:category].each do |key, value|
      category = Category.find key
      category.order = value
      alert = 'Das Verändern der Reihenfolge ist fehlgeschlagen.' unless category.save
    end
    redirect_to admin_categories_path, notice: 'Reihenfolge wurde erfolgreich verändert.' unless alert
    redirect_to admin_categories_path, alert: alert if alert
  end
  
  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
  

end
