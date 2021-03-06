class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    p user
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      @message = "Could not find a matching record, please try again."
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end