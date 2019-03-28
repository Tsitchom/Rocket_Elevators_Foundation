class Elevator < ApplicationRecord
    belongs_to :column
    after_commit do
        if status == 'intervention'
            sendSMS()
        
    end
    end
    def sendSMS() 
        require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure


@client = Twilio::REST::Client.new(ENV['TWILIO_API'], ENV['TWILIO_AUTH'])

message = @client.messages
  .create(
     body: 'An intervention is occuring on one of your elevators',
     from: '+15817056993',
     to: '+14185809201' #CHANGER POUR NUM Dun COACH
   )

puts message.sid
  end
end
