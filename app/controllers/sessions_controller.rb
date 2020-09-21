class SessionsController < ApplicationController
    
    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        if auth && auth['uid']
            login_with_oauth
        else
            login_with_password
        end
    end

   
     
      private

      def login_with_oauth
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.email = auth['info']['email']
        end
        if @user.save(validate: false)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Facebook login failed"
            redirect_to "/login"
        end
      end

      def login_with_password
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Username or Password Incorrect"
            redirect_to "/login"
        end
      end
     
      def auth
        request.env['omniauth.auth']
      end

    





end