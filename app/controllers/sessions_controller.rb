class SessionsController < ApplicationController
#     def new
#     end
#    def create
#     user = User.find_by(email: params[:email])
#     if user && user.authenticate(params[:password])
#      session[:user_id] = user.id
#      flash[:success] = "Login Successful"
#      redirect_to '/'
#     else
#      flash[:warning] = 'Invalid Username or Password'
#      redirect_to '/login'
#     end
#    end
#     def destroy
#      session[:user_id] = nil
#      flash[:success] = 'Logout Successful'
#      redirect_to '/login'
#     end
#    end
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. 
      session[:user_id] = user.id
      flash[:success] = "Login Successful"
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:warning] = 'Invalid Username or Password'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logout Successful'
    redirect_to '/login'
  end
end