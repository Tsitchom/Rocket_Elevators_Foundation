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
      token = auth_bearer.token # This line is step 5 in the diagram.
      

      # At this stage you may want to persist the reusable token we've acquired.
      # Remember that it's bound to the Dropbox account of your user.
  
      # If you persist this token, you can use it in subsequent requests or
      # background jobs to perform calls to Dropbox API such as the following.
      folders = DropboxApi::Client.new(token).list_folder ""
      pp folders
      render html: folders, status: 200
    end

    def index
      folders = DropboxApi::Client.new(File.read('/mnt/c/tmp/token.txt')).list_folder ""
      render json: folders
    end 
  
    private
  
    def authenticator
      client_id = "8xzfla1jkuy35on"
      client_secret = "6p0hnva7i8jbb88"
  
      DropboxApi::Authenticator.new(client_id, client_secret)

    end
  
    def redirect_uri
      dropbox_auth_callback_url # => http://localhost:3000/dropbox/auth_callback
    end
  end