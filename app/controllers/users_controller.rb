class UsersController < ApplicationController
  skip_before_action :authenticate_cookie, only: :create

  def create
    user = User.new(create_params.except(:password))
    user.password = create_params[:password]
    user.save!
  end

  def show
    render json: current_user
  end

  def update
    current_user.update!(update_params)
  end

  private

  def create_params
    params.permit(:login, :password, :name, :surname, :email)
  end

  def update_params
    params.permit(:name, :surname)
  end
end
