class UserSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:username], params[:password])
      redirect_back_or_to(products_path, message: 'Logged in Successfully.')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:products, message: 'Logged out!')
  end
end