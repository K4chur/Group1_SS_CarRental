class HomeController < ApplicationController 
    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to sign_in_path
        end
    end

    def logout 
        session[:user_id] = nil

        redirect_to sign_in_path
    end
end