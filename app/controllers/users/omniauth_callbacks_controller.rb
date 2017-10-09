class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    Rails.logger '===================' * 199
    Rails.logger '===================' * 199
    Rails.logger request.env
    Rails.logger '===================' * 199


    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      Rails.logger @user
      sign_in_and_redirect persisted_path, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook")
    else
      Rails.logger @user 
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_path
    end
  end

  def failure
    redirect_to failure_path
  end
end