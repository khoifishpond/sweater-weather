class Activity
  attr_reader :id, :destination, :forecast, :activities

  def initialize(data)
    @id = nil
    @destination = data[:destination]
    @forecast = {
      summary: data[:forecast].current.conditions,
      temperature: data[:forecast].current.temperature.to_s + ' F'
    }
    @activities = data[:activities].map do |a|
      {
        title: a[:activity],
        type: a[:type],
        participants: a[:participants],
        price: a[:price]
      }
    end
  end
end