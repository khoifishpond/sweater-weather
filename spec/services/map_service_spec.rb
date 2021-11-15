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
end