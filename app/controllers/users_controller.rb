class UsersController < ApplicationController

    def new
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user_id
            redirect_to user_path(@user) 
        else 
            render :new
        end
    end
    

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        @user.update_columns(username: params[:user][:username],
        email: params[:user][:email])
        redirect_to user_path(@user)
    end

    def index
        @user = User.find_by_id(params[:id]) 
    end

    def destroy 
        @user = current_user.destroy
        session.clear
        redirect_to root_path
    end

  

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end




end
