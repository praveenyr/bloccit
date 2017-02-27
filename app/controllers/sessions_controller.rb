class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    binding.pry
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      create_session(current_user)
      flash[:notice] = "Welcome #{user.name}"
      redirect_to root_path
    else
      flash[:alert] = 'Invalid email/password combination'
      render :new
    end
  end
  
  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
    
end
