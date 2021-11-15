require 'rails_helper'

describe BackgroundFacade do
  it 'creates a Background object from a location' do
    params = {query: 'denver,co'}
    background = BackgroundFacade.image(params[:query])

    expect(background).to be_a(Background)
  end
end