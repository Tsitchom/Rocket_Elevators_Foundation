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
account_sid = 'AC095d65393b5cb3530ceeb503e8d42eb9'
auth_token = '3def13f33e8de5589908cd875790cf96'
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
