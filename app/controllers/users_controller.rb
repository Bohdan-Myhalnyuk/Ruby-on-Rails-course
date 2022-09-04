class UsersController < ActionController::Base
    def new
        @user = User.new
    end
end 