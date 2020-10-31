class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password]) #check is password matcehes and user exist, then takes in the id of the user and stores it into a session while they are logged in
            create_session
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    
    
    def destroy
        session.delete(:user_id)
        flash[:notice] = "You have successfully logged out."
        redirect_to '/', notice: "You have successfully logged out."
      end
    
    
    def omniauth
        @user = User.create_google_omniauth(auth)
        if @user
            create_session
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end
    
    def auth
        request.env['omniauth.auth']
    end
    
    end