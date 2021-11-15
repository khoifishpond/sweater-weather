require 'rails_helper'

describe MapFacade do
  it 'gets the latitude and longitude of a location' do
    geocode = MapFacade.lat_long('Denver, CO')

    expect(geocode).to be_a(GeoCode)
  end
end