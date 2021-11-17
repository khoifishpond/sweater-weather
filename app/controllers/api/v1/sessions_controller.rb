class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user)
    else
      render json: error('Unauthorized', 'Incorrect credentials', 401)
    end
  end
end