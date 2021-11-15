class BackgroundFacade
  def self.image(query)
    data = BackgroundService.get_data(query)
    Background.new(data)
  end
end