require 'dropbox_api'
class Lead < ApplicationRecord
    belongs_to :customer, optional: true
    # after_create :createdropbox
    validates :full_name, presence: true
    validates :company_name, presence: true
    validates :email, presence: true

    
    def createdropbox
        if self.attachment
            #Connect to Dropbox with API Key
            client = DropboxApi::Client.new(ENV['DROPBOXAPI'])
            
            #Lead informations
            content = self.attachment.tempfile
            fileName = self.attachment.original_filename
            companyName = self.company_name
            the_time = Time.now
            the_time.strftime "%Y-%m-%d %H:%M"
    
            #Check if business name exist in customer table
            c = Customer.find_by company_name: self.company_name
            
            #If exist
            if c != nil
                self.customer_id = c.id
    
                # Check if there is a file attachment with the lead
                if self.attachment.tempfile != nil
    
                    #Use a Begin/Rescue/End to catch the errors
                    begin
                        client.upload "/#{self.full_name}/#{the_time.strftime "%Y-%m-%d %H:%M"}_#{fileName}", content.read
                    rescue Exception
                        logger.info("ERROR DETECTED: Could not upload your files to Dropbox server.")
                    end
                    self.attachment = nil
                    self.save!
                end
            end    
        end
    end
end