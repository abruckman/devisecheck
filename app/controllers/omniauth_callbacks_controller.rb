class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    p request.env["omniauth.auth"]
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user, notice:"signed in!"
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  # p flash

  alias_method :facebook, :all
end
