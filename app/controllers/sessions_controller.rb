class SessionsController < ApplicationController
   
    def new
    
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have Logged In to Dino Blog"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "sorry but your Email Or Password\nwas not valid or the account does not exist."
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "You have Logged Out of Dino Blog"
        redirect_to root_path
    end
    
end