class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.image(params[:location])
    render json: BackgroundSerializer.new(background)
  end
end