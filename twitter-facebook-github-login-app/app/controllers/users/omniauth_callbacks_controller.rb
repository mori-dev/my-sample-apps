class Users::OmniauthCallbacksController < ApplicationController

  #TODO: じっさいのアプリでは重複をなくすこと

  def twitter
    user = User.where(
      provider: env["omniauth.auth"]["provider"],
      uid:      env["omniauth.auth"]["uid"],
      name:     env["omniauth.auth"]["info"]["name"]
    ).first_or_create
    sign_in user
    redirect_to stored_location_for(:user) || root_path
  end

  def facebook
    user = User.where(
      provider: env["omniauth.auth"]["provider"],
      uid:      env["omniauth.auth"]["uid"],
      name:     env["omniauth.auth"]["info"]["name"]
    ).first_or_create
    sign_in user
    redirect_to stored_location_for(:user) || root_path
  end

  def github
    user = User.where(
      provider: env["omniauth.auth"]["provider"],
      uid:      env["omniauth.auth"]["uid"],
      name:     env["omniauth.auth"]["info"]["name"]
    ).first_or_create
    sign_in user
    redirect_to stored_location_for(:user) || root_path
  end
end
