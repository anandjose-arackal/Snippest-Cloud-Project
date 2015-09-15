class PostsController < ApplicationController
  before_action :confirm_login , :only => [:new,:create,:post_about]
  def index
  	@title="Snippest"
    @posts=Post.select('id,post_heading,post_description,post_tags').last(6)
  end
  
  def new
  	@title="Post a New Article"
  	@post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=session[:user_id]
       if @post.save
        saved_Postid=@post.id 
        @attachment=@post.attachments.new
        redirect_to(new_post_attachment_path(@post,@attachment))
      else
       redirect_to :controller => 'posts' , :action => 'new'
      end
  
  end

  def show
    @post = Post.find(params[:id])
    @user = User.select('id,name').find(@post.user_id)
    @comments=Comment.where("post_id = ?", params[:id])
    @comment_no=@post.comments.count
    @like_no=Like.select('id').where("post_id = ?",params[:id])
    @like=Like.select('id').where("post_id = ? AND user_id =?" ,params[:id] , session[:user_id]).count
      
  end

  def post_about
  	@title="Post a New Article"
  end

  private 

  def post_params
    params.require(:post).permit(:post_heading,:post_content,:post_description,:post_tags)
  end
end
