class AttachmentsController < ApplicationController

  def new
    @post = Post.find_by_id(params[:post_id])
    @attachment = @post.attachments.new
      respond_to do |format|
         format.html
      end
  end
  
  def create
  	#create a unique name
  	file_key= filename# uniqe name
  	file_ext=File.extname(params[:file].original_filename)
  	file_key=file_key+file_ext
    file_url=(params[:file].path)
  	#Create S3 object
    
  	obj = S3.bucket('snippestanandjose').object(file_key)
    obj.upload_file(file_url, acl:'public-read')
    
    @post=Post.find(params[:post_id])
    @attachment=@post.attachments.create
    @attachment.attachment_link=obj.public_url

    if @attachment.save
      redirect_to controller: 'welcome' , action: 'index'
      flash.now[:notice] = 'Upload Successfull'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
    
   end

private

    def filename
         "#{SecureRandom.urlsafe_base64}"
    end    
end
