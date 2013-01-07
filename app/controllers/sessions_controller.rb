class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      # Sign the user in and redirect to the user's show page
      sign_in user
      redirect_back_or user
    else
      # First usage of .now to prevent double flash from appearing ( because a render is not a request)
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
=begin
    # Refactoring exercise to use form_tag instead of form_for
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page
      sign_in user
      redirect_to user
    else
      # First usage of .now to prevent double flash from appearing ( because a render is not a request)
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
=end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
