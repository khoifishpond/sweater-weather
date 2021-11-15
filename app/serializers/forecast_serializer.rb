class ForecastSerializer
  include JSONAPI::Serializer

  set_id :id
  
  attributes :current, :daily, :hourly
end