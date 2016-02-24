class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def stripe_connect
    @user = current_user
    if @user.update_attributes({
         #provider: request.env["omniauth.auth"].provider,
         token_type: request.env["omniauth.auth"].extra.raw_info.token_type,
         stripe_publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key,
         livemode: request.env["omniauth.auth"].info.livemode,
         stripe_user_id: request.env["omniauth.auth"].uid,
         access_token: request.env["omniauth.auth"].credentials.token,
         refresh_token: request.env["omniauth.auth"].credentials.refresh_token,
         stripe_connected: true
       })
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Stripe") if is_navigational_format?
    else
      session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    request.env["omniauth.auth"]
  end
end