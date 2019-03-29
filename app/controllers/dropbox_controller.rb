class DropboxController < ApplicationController
    # Example call:
    # GET /dropbox/auth
    def auth
      url = authenticator.authorize_url :redirect_uri => redirect_uri
  
      redirect_to url
    end
  
    def auth_callback
        p params
      auth_bearer = authenticator.get_token(params[:code],
                                            :redirect_uri => redirect_uri)
      token = auth_bearer.token 
      
      folders = DropboxApi::Client.new(token).list_folder ""
      pp folders
      render html: 'Dropbox connected', status: 200
    end
    
    private
    
    def authenticator
        client_id = "8xzfla1jkuy35on"
        client_secret = "6p0hnva7i8jbb88"
        DropboxApi::Authenticator.new(client_id, client_secret)
    end
    
    

    def redirect_uri
      dropbox_auth_callback_url # => http://raphaelvallee.com/dropbox/auth_callback
    end
    
end
