class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authenticate_cookie, except: :not_found

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActionController::UnpermittedParameters, with: :unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from JWT::ExpiredSignature, with: :token_expired
  rescue_from JWT::DecodeError, JWT::VerificationError, with: :token_invalid

  def not_found
    render json: {error: "page not found"}, status: 404
  end

  private

  def record_not_found(exception)
    render json: {error: exception.message}, status: 404
  end

  def unprocessable_entity(exception)
    render json: {error: exception.message}, status: 422
  end

  def parameter_missing(exception)
    render json: {error: exception.message}, status: 400
  end

  def token_expired(_)
    render json: {error: "token expired"}, status: 403
  end

  def token_invalid(_)
    render json: {error: "invalid token"}, status: 403
  end

   def authenticate_cookie
     token = cookies[:jwt] unless cookies.nil?
     decoded_token = ::Services::JsonWebToken.decode(token)

     @current_user ||= User.find(decoded_token[:user_id])
   end

  protected

  attr_reader :current_user
end