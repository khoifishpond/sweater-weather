require 'rails_helper'

describe ActivitiesFacade do
  it 'creates an Activity object from a destination' do
    param = {destination: 'chicago, il'}
    activities = ActivitiesFacade.activity(param[:destination])
    
    expect(activities).to be_an(Activity)
  end
end