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
        redirect_to :controller => 'welcome' , :action => 'index'
      else
       redirect_to :controller => 'posts' , :action => 'new'
      end
  
  end

  def show
    @post = Post.find(params[:id])
    #@post=Post.includes(:comments).find(params[:id])
    @user = User.find(@post.user_id)
    #@comments=Comment.where("post_id = ?", params[:id])
    @comments=@post.comments

  end

  def post_about
  	@title="Post a New Article"
  end

  private 

  def post_params
    params.require(:post).permit(:post_heading,:post_content,:post_description,:post_tags)
  end
end
