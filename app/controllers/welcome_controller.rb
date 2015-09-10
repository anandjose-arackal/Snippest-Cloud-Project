class WelcomeController < ApplicationController
  def index
  	title="Snippest"
    @posts=Post.select('id,post_heading,post_description,post_tags').last(6)

  end

  def about
  end
end
