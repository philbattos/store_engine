class UserSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:login_id], params[:password])

      user = User.where(username: params[:login_id]).pop
      user ||= User.where(email: params[:login_id]).pop

      if user.admin == true
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
    redirect_to(root_path, message: 'Logged out!')
  end
end
