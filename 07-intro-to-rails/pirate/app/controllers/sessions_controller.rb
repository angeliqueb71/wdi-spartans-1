class SessionsController < ApplicationController
  def sign_in_form
  end

  def sign_in
    @user = User.find_by(email: params[:email])

    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "You have been signed in successfully"
      redirect_to root_path
    else
      flash[:alert] = "Your username and password combination do not match"
      redirect_to :back
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
  end
end
