class UsersController < ApplicationController

    
    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to users_url
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end