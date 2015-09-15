class UserPController < ApplicationController
	def new
		@user = User.find_by_id(params[:use_id])
        @user_p = @user.user_Ps.new
           respond_to do |format|
             format.html
           end
	end

	def show
		@user=User.find(session[:user_id])
		@user_img=UserP.select('id,user_id,p_users_img_path').where("user_id = ?",session[:user_id])
		@posts=Post.select('id,post_heading,post_description,created_at').where("user_id= ?",session[:user_id]).last(10)
	end


end
