require 'rails_helper'
require 'spec_helper'

RSpec.describe DropboxController do 
    
    # Testing if the dropbox controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end

    # Testing if the Dropbox controller responds successfully to its "auth" method
    it "should respond to auth" do
        dropbox = DropboxController.new
        expect(dropbox).to respond_to(:auth)
        get :auth
    end
end