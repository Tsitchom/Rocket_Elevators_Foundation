class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
    format.html {redirect_to "/index#contact"}
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)

    client = DropboxApi::Client.new(ENV['DROPBOXAPI'])
    # p ENV['DROPBOXAPI']
    client.create_folder("/#{@lead.full_name}")
    content = @lead.attachment

    client.upload("/#{@lead.full_name}/#{@lead.company_name}.txt", content.read)

    @lead.attachment = nil

    @lead.save!



  

    
#===============================================================================================================================
 
    @customer = Customer.find_by company_name: params[:lead][:company_name]
    if @customer != nil
        @lead.customer_id = @customer.id
    else @lead.customer_id = nil
    respond_to do |format|
      if @lead.save
        format.html { redirect_to "/index#contact", alert: 'Lead was successfully created.' }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { redirect_to "/index#contact" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:full_name, :company_name, :email, :phone_number, :project_name, :project_description, :department_in_charge, :message, :attachment)
    end

#=================================Dropbox==========================================================================================
# def auth
#       url = authenticator.authorize_url :redirect_uri => redirect_uri
  
#       redirect_to url
#     end

#     def auth_callback
#       p params
#     auth_bearer = authenticator.get_token(params[:code],
#                                           :redirect_uri => redirect_uri)
#     token = auth_bearer.token # This line is step 5 in the diagram.


# def index
#     client = DropboxApi::Client.new("qaWo1RJdDUAAAAAAAAAAb-tCxSmhw1GTHenR0Mq5PpKhroTGcUQ6dvLlefcSWSnr")
    
#     result = client.list_folder "/dropboxfolder"
#     render json: folders
#     result.entries
#     result.has_more?   
#   end

#   def new_lead
#     p = params["lead"].permit!
#     client = DropboxApi::Client.new("qaWo1RJdDUAAAAAAAAAAb-tCxSmhw1GTHenR0Mq5PpKhroTGcUQ6dvLlefcSWSnr")
#     attachment = params["lead"]["attachment"]
#     if attachment
#         p["attachment"] = attachment.read
#     else
#         p["attachment"] = nil
#     end



#     lead = Lead.new(p)
#     lead.valid?
#     lead.errors
#     lead.save!

#     def redirect_uri
#           dropbox_auth_callback_url # => http://localhost:3000/dropbox/auth_callback
#         end

end                                                                                   
