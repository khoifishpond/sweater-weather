class ActivitySerializer
  include JSONAPI::Serializer

  set_id :id
  
  attributes :destination, :forecast, :activities
end