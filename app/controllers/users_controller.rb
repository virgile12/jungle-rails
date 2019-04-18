class UsersController < ApplicationController

    def new
    end
    
    def create
    user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        flash[:success] = "Signup Successful !"
        redirect_to '/'
      else
        flash[:warning] = "Invalid Email or Password"
        redirect_to '/signup'
      end
    end
    
    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end
    

    
