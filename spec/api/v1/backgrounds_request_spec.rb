require 'rails_helper'

describe 'Backgrounds Request' do
  it 'gets a background image for a location' do
    get '/api/v1/backgrounds?location=los angeles,ca'
    background = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(background).to be_a(Hash)
    expect(background).to have_key(:data)
    expect(background[:data]).to have_key(:id)
    expect(background[:data][:id]).to eq(nil)
    expect(background[:data]).to have_key(:type)
    expect(background[:data][:type]).to eq('image')
    expect(background[:data]).to have_key(:attributes)
    expect(background[:data][:attributes]).to have_key(:image)
    expect(background[:data][:attributes][:image]).to have_key(:location)
    expect(background[:data][:attributes][:image][:location]).to be_a(String)
    expect(background[:data][:attributes][:image]).to have_key(:image_url)
    expect(background[:data][:attributes][:image][:image_url]).to be_a(String)
    expect(background[:data][:attributes][:image][:credit]).to have_key(:author)
    expect(background[:data][:attributes][:image][:credit][:author]).to be_a(String)
    expect(background[:data][:attributes][:image][:credit]).to have_key(:link)
    expect(background[:data][:attributes][:image][:credit][:link]).to be_a(String)
  end

  describe 'Sad Path' do
    it 'shows an error without a location' do
      get '/api/v1/backgrounds'
      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:errors)
      expect(error[:errors]).to be_an(Array)
      expect(error[:errors][0]).to have_key(:status)
      expect(error[:errors][0][:status]).to eq('Bad Request')
      expect(error[:errors][0]).to have_key(:message)
      expect(error[:errors][0][:message]).to eq('Location is required')
      expect(error[:errors][0]).to have_key(:code)
      expect(error[:errors][0][:code]).to eq(400)
    end
  end
end