class Activity
  attr_reader :id, :destination, :forecast, :activities

  def initialize(data)
    @id = nil
    @destination = data[:destination]
    @forecast = format_forecast(data)
    @activities = format_activities(data)
    end
  end

  private

  def format_forecast(data)
    {
      summary: data[:forecast].current.conditions,
      temperature: data[:forecast].current.temperature.to_s + ' F'
    }
  end

  def format_activities(data)
    data[:activities].map do |a|
      {
        title: a[:activity],
        type: a[:type],
        participants: a[:participants],
        price: a[:price]
      }
  end
end