class Activity
  attr_reader :id, :destination, :forecast, :activities

  def initialize(data)
    require 'pry'; binding.pry
    @id = nil
    @destination = data[:destination]
    @forecast = {
      summary: data[:forecast].current.conditions,
      temperature: data[:forecast].current.temperature
    }
    @activities = {
      title: data[:activities]
    }
  end
end