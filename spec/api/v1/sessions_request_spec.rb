require 'rails_helper'

describe 'Sessions Request' do
  it 'logs in a registered user' do
    user_params = {
      email: 'yourname@email.com',
      password: 'password',
      password_confirmation: 'password'
    }
    User.create!(user_params)
    post '/api/v1/sessions', params: {
      email: 'yourname@email.com',
      password: 'password'
    }
    user = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(user).to be_a(Hash)
    expect(user).to have_key(:data)
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq('users')
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end
end