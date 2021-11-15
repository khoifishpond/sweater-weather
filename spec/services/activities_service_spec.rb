require 'rails_helper'

describe ActivitiesService do
  it 'gets an activity' do
    param = {type: 'relaxation'}
    response = ActivitiesService.get_activity(param[:type])

    expect(response).to be_a(Hash)
    expect(response).to have_key(:activity)
    expect(response[:activity]).to be_a(String)
    expect(response).to have_key(:type)
    expect(response[:type]).to be_a(String)
    expect(response).to have_key(:participants)
    expect(response[:participants]).to be_an(Integer)
    expect(response).to have_key(:price)
    expect(response[:price]).to be_a(Float).or be_an(Integer)
  end
end