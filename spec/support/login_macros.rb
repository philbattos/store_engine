# module LoginMacros
#   def set_user_session(user)
#     session[:user_id] = user.id
#   end

#   def sign_in(user)
#     visit root_path
#     click_link 'Login'
#     fill_in 'username/email', with: user.username
#     fill_in 'password', with: user.password
#     click_button 'Login'
#   end
# end
