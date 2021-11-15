class MapFacade
  def self.lat_long(city_state)
    data = MapService.get_data(city_state)[:results][0][:locations][0][:latLng]
    GeoCode.new(data)
  end
end