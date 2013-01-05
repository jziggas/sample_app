class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      # The default action for rails is to render the corresponding 'create' view. Instead, we will redirect to the newly created user profile page.
      redirect_to @user
    else
      render 'new'
    end
  end
  
end
