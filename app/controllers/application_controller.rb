class ApplicationController < ActionController::Base

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      end


      ##In short, a||=b means: If a is undefined, nil or false, assign b to a. Otherwise, keep a intact.
end
