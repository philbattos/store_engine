class UserSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:login_id], params[:password])
      admin = User.where(username: params[:login_id]).pop.admin
      if admin == true
        redirect_back_or_to(admin_url, message: 'Welcome Administrator!')
      else
        redirect_back_or_to(root_path, message: 'Logged in Successfully.')
      end
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
