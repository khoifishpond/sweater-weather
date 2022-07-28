require 'rails_helper'

describe BackgroundService do
  it 'gets a background image from a location' do
    response = BackgroundService.get_data('los angeles,ca')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results][0]).to have_key(:urls)
    expect(response[:results][0][:urls]).to have_key(:full)
    expect(response[:results][0][:urls][:full]).to be_a(String)
    expect(response[:results][0]).to have_key(:user)
    expect(response[:results][0][:user]).to have_key(:username)
    expect(response[:results][0][:user][:username]).to be_a(String)
    expect(response[:results][0][:user]).to have_key(:portfolio_url)
    expect(response[:results][0][:user][:portfolio_url]).to be_a(String)
    expect(response[:results][0]).to have_key(:tags)
    expect(response[:results][0][:tags]).to be_an(Array)
    response[:results][0][:tags].each do |tag|
      expect(tag).to have_key(:title)
      expect(tag[:title]).to be_a(String)
    end
  end
end