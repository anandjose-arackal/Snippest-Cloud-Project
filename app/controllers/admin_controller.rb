class AdminController < ApplicationController
  def index
  	 if session[:user_name]=="admin"
  	 	@user_cnt=User.all.count
  	 	@post_cnt=Post.all.count
  	 	@comment_cnt=Post.all.count
  	 	@userdet_cnt=Userdet.all.count
  	 	@attach_cnt=Attachment.all.count
  	 	@user=User.select("created_at").all
  	 	@post=Post.all
  	 else
  	 	session[:user_name]=nil
  	 	session[:user_id]=nil
  	 	redirct_to :contoller => 'users', :action => 'login'
  	 end
  end
end
