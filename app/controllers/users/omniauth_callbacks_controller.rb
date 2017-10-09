class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    binding.pry

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect persisted_path, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook")
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_path 
    end
  rescue => e
    binding.pry
    Rails.logger(e)
  end

  def failure
    redirect_to failure_path
  end
end