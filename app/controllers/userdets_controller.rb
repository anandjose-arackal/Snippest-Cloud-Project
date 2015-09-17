class UserdetsController < ApplicationController
before_action :set_params, only: [ :update ]
   def new
		@user = User.find_by_id(params[:user_id])
    @userdet = @user.userdets.new
	end

	def show
		@user=User.find(session[:user_id])
		@user_img=Userdet.select('id,user_id,users_img_path').where("user_id = ?",session[:user_id])
		@posts=Post.select('id,post_heading,post_description,created_at').where("user_id= ?",session[:user_id]).last(10)
	end

	def create
    @user = User.find_by_id(params[:user_id])
    @userdet=@user.userdets.create(userdet_params)
   if params.has_key?(:file)
     file_key= filename# uniqe name
  	 file_ext=File.extname(params[:file].original_filename)
  	 file_key=file_key+file_ext
     file_url=(params[:file].path)
  	#Create S3 object

  	 obj = S3.bucket('snippestanandjose').object(file_key)
     obj.upload_file(file_url, acl:'public-read')
     @userdet.user_img_path=obj.public_url
  else
     @userdet.user_img_path='https://s3-ap-southeast-1.amazonaws.com/snippestanandjose/default_img.jpg'
  end
		 if @userdet.save
              redirect_to controller: 'userdets' , action: 'show'
              flash.now[:notice] = 'Update Successfull'
		 else
             flash.now[:notice] = 'There was an error'
             render :new
		 end
	end

  def update

     if params.has_key?(:file)
       file_key= filename# uniqe name
     	 file_ext=File.extname(params[:file].original_filename)
     	 file_key=file_key+file_ext
       file_url=(params[:file].path)
     	#Create S3 object
     	obj = S3.bucket('snippestanandjose').object(file_key)
      obj.upload_file(file_url, acl:'public-read')
      @userdet.user_img_path=obj.public_url
     end

     if @userdet.update(userdet_params)
       redirect_to controller: 'userdets' , action: 'show'
       flash.now[:notice] = 'Update Successfull'
      else
      flash.now[:notice] = 'There was an error'
      render :new
     end

  end


private

    def userdet_params
    	params.require(:userdet).permit(:user_experiance,:user_field_work)
    end

    def set_params
       @userdet=Userdet.find(params[:id])
    end


    def filename
         "#{SecureRandom.urlsafe_base64}"
    end
end
