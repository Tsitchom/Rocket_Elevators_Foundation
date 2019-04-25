# require 'rails_helper'
# require 'elevator_media/Streamer'
# require 'rest-client'
# require 'rspotify'
  

# describe 'Streamer' do
#     let!(:streamer){Streamer.new}

#     # Testing if the Chuck Norris database returns a succesful quote
#     it 'got response from Chuck' do
#         json_response = JSON.parse(streamer.getChuckNorrisQuote)
#         expect(json_response["type"]).to eq("success")
#     end

#     # Testing if the open-weather API gives back a response
#     it 'got open-weather response' do
#         current_weather = streamer.getWeather['weather'][0]['main']
#         expect(current_weather).to_not eq(nil)
#     end

#     # Testing if asking for a weather forecast gives a response
#     it 'got open-weather forecast' do
#         current_forecast = streamer.getForecast['weather'][0]['main']
#         expect(current_forecast).to_not eq(nil)
#     end

#     it 'spotify login status' do
#         login_status = streamer.getSpotifyStatus
#         expect(RSpotify).to receive(:authenticate) {true}
#         expect(login_status).to eq("true")
#     end
#   end
