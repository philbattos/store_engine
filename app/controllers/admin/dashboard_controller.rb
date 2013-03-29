class Admin::DashboardController < ApplicationController

  before_filter :require_login
  before_filter :require_admin

  def index
  end

  private

  def require_admin
    unless admin?
      flash[:error] = "You must be an administrator to access this page"
      redirect_to root_path
    end
  end

  def admin?
    current_user[:admin]
  end
end
