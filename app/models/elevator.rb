require 'twilio-ruby'

class Elevator < ApplicationRecord
  belongs_to :column
  # enum elevator_status: [:Active, :Inactive, :Intervention_Needed]

  # after_commit do
  #   if elevator_status == 2
  #     sendSMS()
  #   end
  # end


  # # sendSMS uses twilio API to send sms
  # def sendSMS() 
  #   require 'twilio-ruby'

  #   # Your Account Sid and Auth Token from twilio.com/console
  #   # DANGER! This is insecure. See http://twil.io/secure

  #   @client = Twilio::REST::Client.new(ENV['TWILIO_API'], ENV['TWILIO_AUTH'])

  #   #Where the message is sent to the customer to warn him one of his elevators is now in "intervention"
  #   message = @client.messages
  #   .create(
  #     body: "Status of elevator number #{self.id} of column number #{self.column.id} of battery number #{self.column.battery.id} of building at #{self.column.battery.building.address.number_street} in #{self.column.battery.building.address.city} passed to 'intervention needed' ",
  #     from: ENV['phone_sender'],
  #     to: "+1#{self.column.battery.building.phone_number_tech_person}" #CHANGER POUR NUM Dun COACH
  #   )

  #   puts message.sid
  # end

  #    before_save do
  #     if((elevator_status != elevator_status_was) and (elevator_status_was != nil))
  #      notification()
  #     end
  #     end
  #    def notification 
  #      notifier = Slack::Notifier.new ENV["slackAPI"] do
  #        defaults channel: "#elevator_operations",
  #                username: "TeamRaph"
  #      end
      
  #      notifier.ping "The Elevator #{self.id} with serial number #{self.serial_number} changed status from #{self.elevator_status_was} to #{self.elevator_status}"
  #    end


end
