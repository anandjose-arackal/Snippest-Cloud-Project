class UsersController < ApplicationController
  
  def new
    @title ="Signup"
  	@user=User.new
  end
  
  def create
  	   @user=User.new(user_params)
  	   if @user.save
  	   	    redirect_to :controller =>'welcome' , :action => 'index'
  	   	else
  	   	    redirect_to :controller =>'users' ,:action => 'new'
  	   	end
  end

  def login
    @title="Login here"
    @user=User.new
  end  

  def attempt_login 

    if params[:user][:emailid].present? && params[:user][:password].present?

       found_user=User.where(:emailid => params[:user][:emailid]).first

         if found_user

            authorized_user= found_user.authenticate(params[:user][:password])

            if authorized_user

              flash[:notice] = "Welcome"
              session[:user_id]=authorized_user.id
              session[:user_name]=authorized_user.name 
              redirect_to :controller =>'welcome' , :action => 'index'


            else
              
              flash[:notice] = "Oops! Password incorect.."
              redirect_to :action => 'login'

            end
         else
             flash[:notice] = "Oops! Username not exist.." 
             redirect_to :action => 'login'   
         end 

    end  
     
  end
private  

    def user_params
      params.require(:user).permit(:name,:emailid,:password)
    end
end
