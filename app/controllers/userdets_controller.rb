class UserdetsController < ApplicationController

   def new
		@user = User.find_by_id(params[:user_id])
        @userdet = @user.userdets.new
           respond_to do |format|
             format.html
           end
	end

	def show
		@user=User.find(session[:user_id])
		@user_img=Userdet.select('id,user_id,users_img_path').where("user_id = ?",session[:user_id])
		@posts=Post.select('id,post_heading,post_description,created_at').where("user_id= ?",session[:user_id]).last(10)
	end

	def create
    file_key= filename# uniqe name
  	file_ext=File.extname(params[:file].original_filename)
  	file_key=file_key+file_ext
    file_url=(params[:file].path)
  	#Create S3 object

  	obj = S3.bucket('snippestanandjose').object(file_key)
    obj.upload_file(file_url, acl:'public-read')

		@user = User.find_by_id(params[:user_id])
		@userdet=@user.userdets.create(userdet_params)
    @userdet.user_img_path=obj.public_url
		 if @userdet.save
              redirect_to controller: 'userdets' , action: 'show'
              flash.now[:notice] = 'Update Successfull'
		 else
             flash.now[:notice] = 'There was an error'
             render :new
		 end
	end

  def update
    
  end


private

    def userdet_params
    	params.require(:userdet).permit(:user_experiance,:user_field_work)
    end

    def filename
         "#{SecureRandom.urlsafe_base64}"
    end
end
