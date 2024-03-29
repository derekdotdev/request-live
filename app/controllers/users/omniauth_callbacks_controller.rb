class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # This will throw if @user is not activated
      set_flash_message(:success, :success, kind: 'Facebook')
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to @user
    end
  end

  def failure
    redirect_to failure_path
  end
end
