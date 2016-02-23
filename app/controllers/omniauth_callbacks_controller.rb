class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def stripe_connect
    byebug
    # request.env["omniauth.auth"].to_yaml
  end
end