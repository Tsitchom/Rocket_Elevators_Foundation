require 'sendgrid-ruby'
include SendGrid

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

    #==================================== Zendesk API session =============================================# 
    if @lead.attachment != nil
      message = "The Contact uploaded an attachment"
    else 
      message = "No file attachment"
    end

    ZendeskAPI::Ticket.create!($client, 
      :subject => "#{@lead.full_name} from #{@lead.company_name}", 
      :comment => { :value => "The contact #{@lead.full_name} from company #{@lead.company_name} can be reached at email #{@lead.email} and at phone number #{@lead.phone_number}. #{@lead.department_in_charge} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators. 
      #{@lead.project_description} 
      Attached Message: #{@lead.message} 
      #{message}"}, 
      :submitter_id => @lead.id,
      :type => "question",
      :priority => "urgent")
    #==================================== END Zendesk API session =========================================# 

    #================================== Dropbox ===========================================================#
    def create
      @lead = Lead.new(lead_params)
      if @lead.attachment
      #client with the Key
      client = DropboxApi::Client.new(ENV['DROPBOXAPI'])
      #the creation of the folder in dropbox with the name and the email
      client.create_folder("/#{@lead.full_name},#{@lead.email}")
      #add the lead attachement to the variable content
      content = @lead.attachment
      #uploading file
      client.upload("/#{@lead.full_name},#{@lead.email}/#{@lead.company_name}.txt", content.read)
      #delete and save file
      @lead.attachment = nil
      @lead.save!
    end

    # ajouter que si le fichier existe deja, envoyer le fichier dans le dossier existant
    #======================================== END Dropbox =================================================#
 
    @customer = Customer.find_by company_name: params[:lead][:company_name]
    
    if @customer != nil
        @lead.customer_id = @customer.id
    else @lead.customer_id = nil
      respond_to do |format|
        if @lead.save
          sendgrid(@lead)
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

  #==================================== sendgrid API session =============================================# 
  def sendgrid(lead)
    data = JSON.parse("{
      \"personalizations\": [
        {
          \"to\": [
            {
              \"email\": \"#{lead.email}\"
            }
          ],
          \"dynamic_template_data\": {
            \"subject\": \"Sending with SendGrid is Fun\",
            \"name\": \"#{lead.full_name}\",
            \"project_name\": \"#{lead.project_name}\"
          }
        }
      ],
      \"from\": {
        \"email\": \"contactus@rocketelevators.com\"
      },
    \"template_id\": \"d-6cf075098d4e44c98de042a8cb505f8f\"
    }")
 
    sg = SendGrid::API.new(api_key: ENV['sendgrid_api_key'])
    response = sg.client.mail._('send').post(request_body: data)
  end
  #==================================== END sendgrid API session =============================================# 

end
end
