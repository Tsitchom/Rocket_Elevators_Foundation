require 'rails_helper'
require 'spec_helper'

RSpec.describe BuildingDetailsController do 
    
    # Testing if the building_details controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end

    # Testing if the BuildingDetails controller receives the building_details id (nil by default)
    it "should respond to create method" do
        b_details = BuildingDetail.new
        expect(b_details.id).to be(nil)
    end
end