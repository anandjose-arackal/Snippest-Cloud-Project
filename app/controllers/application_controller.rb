class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private 
  def confirm_login
  	unless session[:user_id]
  		flash[:notice] ="Please Login to complete your action"
  		redirect_to :controller =>'users' ,:action =>'login' 
    else

    	return true	
    end
  end
end
