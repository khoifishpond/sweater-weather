require 'rails_helper'

describe MapService do
  it 'gets the geocode for a location' do
    response = MapService.get_data('denver, co')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results][0]).to have_key(:locations)
    expect(response[:results][0][:locations][0]).to have_key(:latLng)
    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lng)
  end

  it 'gets travel time from and to a location' do
    response = MapService.get_directions('Cerritos, CA', 'San Diego, CA')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:route)
    expect(response[:route]).to have_key(:formattedTime)
    expect(response[:route][:formattedTime]).to be_a(String)
    expect(response[:route]).to have_key(:locations)
    expect(response[:route][:locations]).to be_an(Array)
    expect(response[:route][:locations].count).to eq(2)
    response[:route][:locations].each do |location|
      # city
      expect(location).to have_key(:adminArea5)
      expect(location[:adminArea5]).to be_a(String)

      # state
      expect(location).to have_key(:adminArea3)
      expect(location[:adminArea3]).to be_a(String)

      expect(location).to have_key(:latLng)
      expect(location[:latLng]).to have_key(:lat)
      expect(location[:latLng][:lat]).to be_a(Float)
      expect(location[:latLng]).to have_key(:lng)
      expect(location[:latLng][:lng]).to be_a(Float)
    end
  end
end