class UsersController < ActionController::Base
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Alpha Blog #{@user.username}. You have successfuly signed up"
            redirect_to articles_path
        else 
            render "new"
        end 
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update(user_params)
        @user = User.find(params[:id])
        if @user.update
          flash[:notice] = "Your account information was successfuly updated"
          redirect_to articles_path
        else
          render "edit"
    end
    
    private
    
    def user_params
        params.require(:users).permit(:username, :email, :password)
    end
end 