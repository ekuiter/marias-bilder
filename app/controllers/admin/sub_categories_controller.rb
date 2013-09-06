class Admin::SubCategoriesController < ApplicationController

  before_filter :admin_required
  
  def index
    @sub_categories = SubCategory.order :order
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
  
  def order
    params[:sub_category].each do |key, value|
      sub_category = SubCategory.find key
      sub_category.order = value
      alert = 'Das Verändern der Reihenfolge ist fehlgeschlagen.' unless sub_category.save
    end
    redirect_to admin_sub_categories_path, notice: 'Reihenfolge wurde erfolgreich verändert.' unless alert
    redirect_to admin_sub_categories_path, alert: alert if alert
  end
  
  private

  def sub_category_params
    params.require(:sub_category).permit(:title, :description, :category_id)
  end
  

end
