class Admin::ImagesController < ApplicationController

  before_filter :admin_required
  require 'net/http'
  require 'net/ftp'
  require 'cgi'

  def http_get domain, path, params
    return Net::HTTP.get(domain, "#{path}?".concat(params.collect { |k, v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&'))) unless params.nil?
    return Net::HTTP.get(domain, path)
  end

  def upload_image_file image, file
    return false unless file
    ftp = Net::***REMOVED***, '***REMOVED***', '***REMOVED***'
    ftp.passive = true
    ftp.chdir "***REMOVED***"    
    ftp.storbinary "STOR #{image.id}#{File.extname(file.original_filename).downcase}", 
      StringIO.new(file.read),
      Net::FTP::DEFAULT_BLOCKSIZE
    ftp.quit
    res = ***REMOVED***, "***REMOVED***",
                   {pass: "***REMOVED***",
                    image: image.id, ext: File.extname(file.original_filename).downcase.gsub(".", "")}
    logger.debug "Image #{image.id} resized: " + res
    return true if res.include? "Success"
    flash[:alert] = "Das Bild konnte nicht hochgeladen werden."
    return false 
  end
  
  def delete_image_file image
    ftp = Net::***REMOVED***, '***REMOVED***', '***REMOVED***'
    ftp.passive = true
    ftp.chdir "***REMOVED***"
    ftp.delete "#{image.id}l.jpg"
    ftp.delete "#{image.id}s.jpg"
    ftp.quit
  end
  
  def index
    @images = Image.all
  end
  
  def new
    @image = Image.new
    @categories = Category.order :order
  end
  
  def create
    @image = Image.new image_params
    @categories = Category.order :order
    if @image.save
      if upload_image_file @image, params[:image][:file]
        redirect_to admin_images_path, notice: 'Bild wurde erfolgreich hinzugefügt.'
      else
        @image.destroy
        flash[:alert] = 'Es wurde kein Bild ausgewählt.' unless flash[:alert]
        render action: 'new'
      end
    else
      render action: 'new'
    end
  end
  
  def edit
    @image = Image.find params[:id]
    @categories = Category.order :order
  end
  
  def update
    @image = Image.find params[:id]

    if @image.update_attributes image_params
      flash[:alert] = nil unless upload_image_file @image, params[:image][:file]
      redirect_to admin_images_path, notice: 'Bild wurde erfolgreich verändert.'
    else
      render action: "edit"
    end
  end
  
  def destroy
    @image = Image.find params[:id]
    delete_image_file @image
    @image.destroy
    redirect_to admin_images_path, notice: 'Bild wurde erfolgreich gelöscht.'
  end
  
  private

  def image_params
    params.require(:image).permit(:title, :description, :sub_category_id)
  end

end
