class SignInController < ApplicationController
    layout "base_layout"
    
    def index
        @user = User.new
    end

    def login
        #test code
        if !session[:user_id]
            session[:user_id] = User.first.id
        end

        redirect_to root_path
    end
end