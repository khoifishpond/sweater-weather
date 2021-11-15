require 'rails_helper'

describe Activity do
  it 'exists' do
    geocode = MapFacade.lat_long('chicago,il')
    forecast = WeatherFacade.forecast(geocode.lat, geocode.long)
    activities = [
      ActivitiesService.get_activity('relaxation'),
      ActivitiesService.get_activity('cooking')
    ]
    result = Activity.new(destination: 'chicago,il', forecast: forecast, activities: activities)
    
    expect(result).to be_an(Activity)
    expect(result.id).to eq(nil)
    expect(result.destination).to eq('chicago,il')
    
    expect(result.forecast).to be_a(Hash)
    expect(result.forecast).to have_key(:summary)
    expect(result.forecast[:summary]).to be_a(String)
    expect(result.forecast).to have_key(:temperature)
    expect(result.forecast[:temperature]).to be_a(String)

    expect(result.activities).to be_an(Array)
    require 'pry'; binding.pry
    expect(result.activities.count).to eq(2)
    result.activities.each do |activity|
      expect(activity).to have_key(:title)
      expect(activity[:title]).to be_a(String)
      expect(activity).to have_key(:type)
      expect(activity[:type]).to be_a(String)
      expect(activity).to have_key(:participants)
      expect(activity[:participants]).to be_an(Integer)
      expect(activity).to have_key(:price)
      expect(activity[:price]).to be_a(Float).or be_an(Integer)
    end
  end
end