require 'spec_helper'

describe Admin::DashboardController do

  describe "GET 'index'" do
    context "admin signed in" do
      it "returns http success" do
        user = User.create(username: "admin",
                              email: "admin@example.com",
                         first_name: "dan",
                          last_name: "mee",
                              admin: true,
                           password: "secrettt",
              password_confirmation: "secrettt")

        session[:user_id] = user

        get 'index'
        response.should be_success
      end
    end

    context "non-admin signed in" do
      it "redirects to the home page" do
        user = User.create(username: "admin",
                      email: "admin@example.com",
                 first_name: "dan",
                  last_name: "mee",
                   password: "secrettt",
      password_confirmation: "secrettt")

        session[:user_id] = user

        get 'index'
        response.should redirect_to root_path
      end
    end
  end



  # describe "GET 'index'" do
  #   it "returns http success" do
  #     get 'index'
  #     response.should be_success
  #   end
  # end
end
# , admin: true

# User.create(username: "qerkgjn", email: "forpekf@example.com", first_name: "dan", last_name: "mee", password: "secrettt", password_confirmation: "secrettt")

