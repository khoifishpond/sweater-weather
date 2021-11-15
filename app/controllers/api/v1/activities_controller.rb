class Api::V1::ActivitiesController < ApplicationController
  def index
    activity = ActivitiesFacade.activity(params[:destination])
    render json: ActivitiesSerializer.new(activity)
  end
end