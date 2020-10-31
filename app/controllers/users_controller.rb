class UsersController < ApplicationController

    def new
        @user = User.new
    end 


    #You create Model's object user with empty fields. This variable is instance variable for this object and you can access to it in your view and you use it in form fields

    def create
        @user = User.new(user_params) #new used for get/create used for post
        if @user.save
          create_session
          redirect_to user_path(@user) #/user/user.id
      else
          render :new
      end
  end
    
      def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
      end
    
      private
    
      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
    end
