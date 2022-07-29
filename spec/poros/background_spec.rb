require 'rails_helper'

describe Background do
  it 'exists' do
    params = {query: 'golden,co'}
    data = BackgroundService.get_data(params[:query])
    background = Background.new(data)

    expect(background).to be_a(Background)
    expect(background.id).to eq(nil)
    expect(background.image).to be_a(Hash)
    expect(background.image[:location]).to eq("#{data[:results][0][:tags][1][:title]},#{data[:results][0][:tags][0][:title]}")
    expect(background.image[:image_url]).to eq(data[:results][0][:urls][:full])
    expect(background.image[:credit]).to be_a(Hash)
    expect(background.image[:credit][:author]).to eq(data[:results][0][:user][:username])
    expect(background.image[:credit][:link]).to eq(data[:results][0][:user][:portfolio_url])
  end
end