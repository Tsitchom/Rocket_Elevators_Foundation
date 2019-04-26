require 'rails_helper'
require 'spec_helper'

'/mnt/c/Users/rapha/Desktop/Rocket_Elevators_Foundation/app/controllers/interventions_controller.rb'

RSpec.describe StatsController do 
    
    # Testing if the "authenticate" method returns a succesful response
    it"should give back a 200 succesful HTTP response" do
        expect(response.status).to eq (200)
    end
end