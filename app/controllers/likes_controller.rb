class LikesController < ApplicationController

def like
  @user =User.find(session[:user_id])
  @post = Post.find(params[:post_id])
  @user.like!(@post)
  @like=Like.select('id').where("post_id = ? AND user_id =?" ,params[:post_id] , session[:user_id]).count

  respond_to do |format|
           format.html{redirect_to @post}
		   format.js # render likes/like.js.erb
		end
end

def unlike
  @user = User.find(session[:user_id])
  @like = @user.likes.find_by_post_id(params[:post_id])
  @post = Post.find(params[:post_id])
  @like.destroy!
  @like=Like.select('id').where("post_id = ? AND user_id =?" ,params[:post_id] , session[:user_id]).count

   respond_to do |format|
           format.html{redirect_to @post}
		   format.js # render likes/unlike.js.erb
		end
end

end
