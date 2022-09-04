class SessionsController < ActionController::Base
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "There is something wrong with your login details"
      render 'new'
    end 
  end
  
  def destroy
    session[:user_id] = nil
  end
end 