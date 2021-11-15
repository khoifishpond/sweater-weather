require 'rails_helper'

describe ActivitiesFacade do
  it 'creates an Activity object from a destination' do
    param = {destination: 'chicago, il'}
    activity = ActivitiesFacade.activity(param[:destination])
    
    expect(activity).to be_an(Activity)
  end
end