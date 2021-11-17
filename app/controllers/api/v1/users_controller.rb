class Api::V1::UsersController < ApplicationController
  def create
    if user_params[:email].nil? || user_params[:password].nil? || user_params[:password_confirmation].nil?
      render json: error('Bad Request', 'Fields cannot be left blank', 400)
    elsif user_params[:password_confirmation] != user_params[:password]
      render json: error('Bad Request', 'Passwords do not match', 400)
    elsif User.find_by(email: user_params[:email])
      render json: error('Bad Request', 'Email already in use', 400)
    else
      user_params[:email] = user_params[:email].downcase!
      new_user = User.create!(user_params)
      render json: UsersSerializer.new(new_user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end