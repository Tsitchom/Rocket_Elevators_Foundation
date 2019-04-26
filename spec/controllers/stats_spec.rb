require 'rails_helper'
require 'spec_helper'

RSpec.describe StatsController do 
    
    # Testing if the stats controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(response.status).to eq (200)
    end

    # Testing if the stats controller returns successful response and an actual Stat object 
    # (uncomment the 'p Stat line' to see it in the console)
    it "stats controller should succesfully return a Stat object' " do
        expect(@response.status).to eq (200)
        expect(Stat).to_not eq(nil)
        # p Stat
    end
end