require 'rails_helper'
require 'spec_helper'

RSpec.describe PagesController do 
    
    # Testing if the pages controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end

    # Testing if the pages controller returns a successful response and an actual Lead object 
    # (uncomment the 'p Lead' line to see it in the console)
    it "index method should succesfully return a Lead object' " do
        expect(@response.status).to eq (200)
        expect(Lead).to_not eq(nil)
        get :index
        # p Lead
    end

    # Testing if the pages controller returns a successful response and an actual Quote object
    # (uncomment the 'p Quote' line to see it in the console)
    it "gform method should succesfully return a Quote object " do
        expect(@response.status).to eq (200)
        expect(Quote).to_not eq(nil)
        get :gform
        # p Quote
    end

    # Testing if the pages controller returns a successful response and an actual Building object
    # (uncomment the 'p Building' line to see it in the console)
    it "mapsAPI method should successfully returns a Building object " do
        expect(@response.status).to eq (200)
        expect(Building).to_not eq(nil)
        get :mapsAPI
        # p Building
    end
end