class Elevator < ApplicationRecord
    belongs_to :column
    # before_save do 
    
    #    notification()
    #end

    #def notification
        # notifier = Slack::Notifier.new ENV["slackAPI"] do
        #     defaults channel: "",
        #              username: "Team Raphël"
        #   end
          
        #   notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
          # => will message "Hello default"
          # => to the "#default" channel as 'notifier'
   # end



end
