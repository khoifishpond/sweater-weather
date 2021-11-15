require 'rails_helper'

describe WeatherFacade do
  it 'creates a Forecast object from a location' do
    params = {lat: 39.74, lng: -104.99}
    forecast = WeatherFacade.forecast(params[:lat], params[:lng])

    expect(forecast).to be_a(Forecast)
  end
end