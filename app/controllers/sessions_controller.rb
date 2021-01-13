class SessionsController < ApplicationController
  DOMAIN = 'bookshareify-api.herokuapp.com'
  include BCrypt

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_credentials

  before_action :authenticate_cookie, only: :destroy

  def destroy
    cookies.delete(:jwt, domain: DOMAIN, same_site: :none)

    head :ok
  end

  def create
    login = login_params[:login]
    password = login_params[:password]
    user = User.find_by!(login: login)

    if user.password == password
      token = user.generate_token
      cookies[:jwt] = {value:  token, domain: DOMAIN, same_site: :none, expires: 24.hours}

      render json: {message: "authenticated"}
    else
      invalid_credentials(nil)
    end
  end

  private

  def login_params
    params.permit(:login, :password)
  end

  def invalid_credentials(_)
    render json: {error: 'invalid credentials'}, status: 403
  end
end
