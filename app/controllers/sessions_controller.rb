class SessionsController < ApplicationController

    def welcome

    end 

    def new
    end 

    def create

        if params[:provider] == 'google_oauth2'
            @user = User.create_by_google_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
      
        else 
        @user = User.find_by(username: params[:user][:username]) #find person
        @user && @user.authenticate(params[:user][:password]) #check password
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "Sorry, you messed up, Try Again"
            redirect_to login_path
        end
    end
    
    
    def destroy
        session.delete(:user_id)
        flash[:notice] = "You have successfully logged out."
        redirect_to '/', notice: "You have successfully logged out."
    end
    

    def omniauth
        @user = User.create_by_google_omniauth(auth)
    
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    
      private
    
        def auth
          request.env['omniauth.auth']
        end
end