class ActivitiesFacade
  def self.activity(destination)
    geocode = MapFacade.lat_long(destination)
    forecast = WeatherFacade.forecast(geocode.lat, geocode.long)
    activities = []
    
    activities << ActivitiesService.get_activity('relaxation')

    if forecast.current.temperature >= 60
      activities << ActivitiesService.get_activity('recreational')
    elsif forecast.current.temperature >= 50 && forecast.current.temperature < 60
      activities << ActivitiesService.get_activity('busywork')
    else
      activities << ActivitiesService.get_activity('cooking')
    end

    Activity.new(destination: destination, forecast: forecast, activities: activities)
  end
end