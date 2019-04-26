require 'open_weather'
require 'rest-client'
require 'rspotify'
require 'rails_helper'
require 'elevator_media/Streamer'

module ElevatorMedia
  class Streamer

      # method initialozing the sources or API keys for the API calls below
      def initialize
          @chuck_norris = 'http://api.icndb.com/jokes/random'
          @open_weather = ENV['open_weather_api']
      end

      # required method from week 10 Codeboxx file
      def getContent(type='chuck_norris')
          getHtmlFromCloud(type)
      end

      # method that returns a specific html depending on the "type" asked in the getContent method, is 'chuck_norris' by default
      def getHtmlFromCloud(type)
        if type == 'chuck_norris'  
          return "<div class='elevator-media-streamer-content'>#{JSON.parse(self.getChuckNorrisQuote)['value']['joke']}</div>"  
        end 
        if type == 'weather'  
          return "<div class='elevator-media-streamer-content'>#{self.getWeather}</div>"  
        end 
        if type == 'spotify'  
          return "<div class='elevator-media-streamer-content'>#{JSON.parse(self.getSpotifyUser)}</div>"  
        end 
      end

      # method that gets a random Chuck Norris quote/joke 
      def getChuckNorrisQuote
          @response = RestClient::Request.execute(method: :get, url: @chuck_norris, header: {})
      end

      # method that gets the weather for a specific city, Quebec in this case
      def getWeather
          # get current weather by city name
          options = { units: "metric", APPID: @open_weather }
          OpenWeather::Current.city("Quebec City, CA", options)
      end

      # method that gets the weather forecast for a selected city, in this case Quebec city
      def getForecast
          options = { units: "metric", APPID: @open_weather }
          OpenWeather::Current.city("Quebec City, CA", options)
      end

      # method that gets a response from Spotify to check connection
      def getSpotifyResponse
        RSpotify.raw_response = true
        @spotify_response = RSpotify.raw_response
      end

      # method that gets the status of a Spotify connection with the selected client ID and secret
      def getSpotifyStatus
          @status = RSpotify::authenticate(ENV['spot_client_id'], ENV['spot_client_secret'])
      end

      # method that gets a specific Spotify user with the username
      def getSpotifyUser
          @user = RSpotify::User.find("awoggddbv0ucdh3b1w86p4wmu")
      end
      
  end
end