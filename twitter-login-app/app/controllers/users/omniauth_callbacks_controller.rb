class Users::OmniauthCallbacksController < ApplicationController

  def twitter
    user = User.where(
      provider: env["omniauth.auth"]["uid"],
      uid:      env["omniauth.auth"]["provider"],  # twitter
      name:     env["omniauth.auth"]["info"]["name"]
    ).first_or_create

    sign_in user
    redirect_to stored_location_for(:user) || root_path
  end

end
