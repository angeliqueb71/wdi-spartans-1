class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    User.create(params_user)

    # User.create(
    #   fname: params[:user][:fname],
    #   lname: params[:user][:lname],
    #   avatar: params[:user][:avatar]
    # )

    redirect_to :root
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def params_user
    params.require(:user).permit(:fname, :lname, :avatar)
  end
end
