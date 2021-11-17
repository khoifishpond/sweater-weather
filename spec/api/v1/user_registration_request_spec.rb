require 'rails_helper'

describe 'User Registration' do
  it 'creates a user' do
    post '/api/v1/users', params: {
      email: 'yourNAME@email.com',
      password: 'password',
      password_confirmation: 'password'
    }
    user = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(user).to be_a(Hash)
    expect(user).to have_key(:data)
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_an(String)
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq('users')
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end

  describe 'Sad Paths' do
    it 'cannot create a user if a field is left blank' do
      post '/api/v1/users', params: {
        password: 'password',
        password_confirmation: 'password'
      }
      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:errors)
      expect(error[:errors]).to be_an(Array)
      expect(error[:errors][0]).to have_key(:status)
      expect(error[:errors][0][:status]).to eq('Bad Request')
      expect(error[:errors][0]).to have_key(:message)
      expect(error[:errors][0][:message]).to eq('Fields cannot be left blank')
      expect(error[:errors][0]).to have_key(:code)
      expect(error[:errors][0][:code]).to eq(400)
    end

    it 'cannot create a user if a passwords do not match' do
      post '/api/v1/users', params: {
        email: 'yourname@email.com',
        password: 'password',
        password_confirmation: 'password123'
      }
      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(error).to have_key(:errors)
      expect(error[:errors]).to be_an(Array)
      expect(error[:errors][0]).to have_key(:status)
      expect(error[:errors][0][:status]).to eq('Bad Request')
      expect(error[:errors][0]).to have_key(:message)
      expect(error[:errors][0][:message]).to eq('Passwords do not match')
      expect(error[:errors][0]).to have_key(:code)
      expect(error[:errors][0][:code]).to eq(400)
    end

    it 'cannot create a user email is already taken' do
      params = {
        email: 'yourname@email.com',
        password: 'password',
        password_confirmation: 'password'
      }
      User.create!(params)
      post '/api/v1/users', params: {
        email: 'yourname@email.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(error).to have_key(:errors)
      expect(error[:errors]).to be_an(Array)
      expect(error[:errors][0]).to have_key(:status)
      expect(error[:errors][0][:status]).to eq('Bad Request')
      expect(error[:errors][0]).to have_key(:message)
      expect(error[:errors][0][:message]).to eq('Email already in use')
      expect(error[:errors][0]).to have_key(:code)
      expect(error[:errors][0][:code]).to eq(400)
    end
  end
end