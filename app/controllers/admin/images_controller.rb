class Admin::ImagesController < ApplicationController

  before_filter :admin_required
  
  def index
    @images = Image.all
  end
  
  def new
    @image = Image.new
    @sub_categories = SubCategory.all
  end
  
  def create
    @image = Image.new image_params
    @sub_categories = SubCategory.all
    if @image.save
      redirect_to admin_images_path, notice: 'Bild wurde erfolgreich hinzugefügt.'
    else
      render action: 'new'
    end
  end
  
  def edit
    @image = Image.find params[:id]
  end
  
  def update
    @image = Image.find params[:id]

    if @image.update_attributes image_params
      redirect_to admin_images_path, notice: 'Bild wurde erfolgreich verändert.'
    else
      render action: "edit"
    end
  end
  
  def destroy
    @image = Image.find params[:id]
    @image.destroy
    redirect_to admin_images_path, notice: 'Bild wurde erfolgreich gelöscht.'
  end
  
  private

  def image_params
    params.require(:image).permit(:title, :description, :file, :sub_category_id)
  end

end
