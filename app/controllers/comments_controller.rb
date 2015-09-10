class CommentsController < ApplicationController
	def create
		@post=Post.find(params[:post_id])
		@comment=@post.comments.create(comment_params)
		@comment.user_id=session['user_id']
		@comment.save
        #redirect_to @post
        respond_to do |format|
           format.html{redirect_to @post}
		   format.js # render comments/comments.create.js.erb
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:comments_content)
	end


end
