class UsersController < ApplicationController
  # corresponds to the route get "/users"
  # this is an action
  def index
    # loads all users in the database
    @users = User.all

    # you can have more than one instance variable
    @colors = ["red", "green"]
  end

  # corresponds to the route get "/users/:id/edit"
  def edit
    # loads user from the database
    @user = User.find(params[:id])
  end

  # corresponds to the route put "/users/:id"
  def update
    @user = User.find(params[:id])
    @user.fname = params[:user][:fname]
    @user.lname = params[:user][:lname]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

    # saves a user
    if @user.save
      # sets a flash notice that says "The user was updated"
      flash[:notice] = "The user was updated"

      # redirects to the user show page
      redirect_to user_path(@user)
    else
      # sets a flash alert that says "The user was updated"
      flash[:alert] = "The user was not updated"

      # redirects to the user edit page
      # redirect_to edit_user_path(@user)
      render :edit
    end
  end

  # corresponds to the route get "/users/new"
  def new
    # creates new user object
    @user = User.new
  end

  # corresponds to the route post "/users/:id"
  def create
    @user = User.new(
      fname: params[:user][:fname],
      lname: params[:user][:lname]
    )

    if @user.save
      flash[:notice] = "The user was created"
      redirect_to user_path(@user)
    else
      # flash[:alert] = "The user was not created"
      render :new
    end
  end

  # corresponds to the route get "/users/:id"
  def show
    # loads one user in the database
    @user = User.find(params[:id])
  end

  # corresponds to the route delete "/users/:id"
  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = "User was deleted"
    else
      flash[:alert] = "User could not be deleted"
    end

    redirect_to users_path
  end
end
