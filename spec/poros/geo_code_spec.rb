require 'rails_helper'

describe GeoCode do
  it 'asfasfasf' do
    params = {lat: 39.74, lng: -104.99}
    location = GeoCode.new(params)

    expect(location.lat).to eq(params[:lat])
    expect(location.long).to eq(params[:lng])
  end
end