require 'rails_helper'
RSpec.describe Strava do
  it 'pings the strava service' do
    Strava.call
  end
end
