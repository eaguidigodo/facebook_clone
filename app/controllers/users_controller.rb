class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(set_params)
        if @user.save()
            redirect_to posts_index_path, notice: "Your account has been succesfully created!"
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def set_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
