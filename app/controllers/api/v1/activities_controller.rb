class Api::V1::ActivitiesController < ApplicationController
  def index
    activity = ActivitiesFacade.activity(params[:destination])
    render json: ActivitySerializer.new(activity)
  end
end