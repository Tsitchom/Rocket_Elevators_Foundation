class InterventionsController < ApplicationController
    before_action :set_intervention, only: [:show, :edit, :update, :destroy]
  
    # GET /quotes
    # GET /quotes.json
    def index
      @interventions = Intervention.all
    end

    # Method (attempt) to filter buildings by customer
    # def get_building_by_customer
    #     @buildings = Building.where("customer_id = ?", params[:customer_id])
    #     respond_to do |format|
    #       format.json { render :json => @buildings }
    #     end
    # end

    # def building_search
    #     if params[:customer_id].present? && params[:customer_id].strip != ""
    #       @buildings = Building.where("customer_id = ?", params[:customer_id])
    #     else
    #       @buildings = Building.all
    #     end
    #   end
  
    # Method to get buildings related to a selected customer
    def get_building
        if params[:customer].present?
            @buildings = Customer.find(params[:customer]).buildings
        else
            @buildings = Customer.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {buildings: @buildings}
                }
            end
        end
    end

    # Method to get batteries related to a selected building
    def get_battery
        if params[:building].present?
            @batteries = Building.find(params[:building]).batteries
        else
            @batteries = Building.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {batteries: @batteries}
                }
            end
        end
    end

    # Method to get columnns related to a selected battery
    def get_column
        if params[:battery].present?
            @columns = Battery.find(params[:battery]).columns
        else
            @columns = Battery.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {columns: @columns}
                }
            end
        end
    end

    # Method to get elevators related to a selected column
    def get_elevator
        if params[:column].present?
            @elevators = Column.find(params[:column]).elevators
        else
            @elevators = Column.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {elevators: @elevators}
                }
            end
        end
    end
    # GET /quotes/1
    # GET /quotes/1.json
    def show
    end
  
    # GET /quotes/new
    def new
      @intervention = Intervention.new
    end
  
    # GET /quotes/1/edit
    def edit
    end

  #   def intervention
	# 	@intervention = Intervention.new
	# end
  
    # POST /quotes
    # POST /quotes.json
    def create
  

      #==================================== Zendesk API session =============================================#  
      # create a personalized ticket 
      # ZendeskAPI::Ticket.create!($client, 
      #   :subject => "#{@intervention.full_name} from #{@intervention.company_name}", 
      #   :comment => { :value => "The contact #{@intervention.full_name} from company #{@intervention.company_name} can be reached at email #{@intervention.email} and at phone number #{@lead.phone_number}. #{@intervention.department_in_charge} has a project named #{@intervention.project_name} which would require contribution from Rocket Elevators. 
      #   #{@intervention.project_description} 
      #   Attached Message: #{@intervention.message} 
      #   #{message}"}, 
      #   :submitter_id => @intervention.id,
      #   :type => "support",
      #   :priority => "urgent")
    #==================================== END Zendesk API session =========================================#  
    
      #==================================== Zendesk API session =============================================#  
      # create a ticket when someone complete the quote form
    #   ZendeskAPI::Ticket.create!($client, 
    #     :subject => "#{@quote.full_name} from #{@quote.company_name}", 
    #     :comment => { :value => "The contact #{@quote.full_name} from company #{@quote.company_name} ask for a quote for #{@quote.number_of_elevators} elevator(s). #{@quote.full_name} can be reached at email #{@quote.email} and at phone number #{@quote.phone_number}. #{@quote.department} has a project which would require contribution from Rocket Elevators. 
    #     No file attached"}, 
    #     :submitter_id => @quote.id,
    #     :type => "question",
    #     :priority => "urgent")
      #==================================== END Zendesk API session =========================================#  
      
      @intervention = Intervention.new(intervention_params)

        @intervention.author = current_user.id
        @intervention.employee_id = params[:employee]
        @intervention.customer_id = params[:customer]
        @intervention.building_id = params[:building]
        @intervention.battery_id = params[:battery]
        @intervention.column_id = params[:column]
        @intervention.elevator_id = params[:elevator]
        @intervention.intervention_result = params["Incomplete"]
        @intervention.report = params[:report]
        @intervention.intervention_status = params["Pending"]
      
    #   elsif params[:quote][:department] == 'Commercial' 
    #     @quote.number_of_apartments = params[:quote][:comm_number_of_apartments]
    #     @quote.number_of_parking = params[:quote][:comm_number_of_parking]
    #     @quote.number_of_basements = params[:quote][:comm_number_of_basements]
    #     @quote.number_of_stores = params[:quote][:comm_number_of_stores]
  
    #   elsif params[:quote][:department] == 'Corporate' 
    #     @quote.number_of_floors = params[:quote][:corp_number_of_floors]
    #     @quote.number_of_basements = params[:quote][:corp_number_of_basements]
    #     @quote.max_occupancy_per_floor = params[:quote][:corp_max_occupancy_per_floor]
    #     @quote.number_of_stores = params[:quote][:corp_number_of_stores]
    #     @quote.number_of_parking = params[:quote][:corp_number_of_parking]
  
    #   elsif params[:quote][:department] == 'Hybrid' 
    #     @quote.number_of_floors = params[:quote][:hyb_number_of_floors]
    #     @quote.number_of_basements = params[:quote][:hyb_number_of_basements]
    #     @quote.max_occupancy_per_floor = params[:quote][:hyb_max_occupancy_per_floor]
    #     @quote.number_of_stores = params[:quote][:hyb_number_of_stores]
    #     @quote.number_of_parking = params[:quote][:hyb_number_of_parking]
    #   end
  
      respond_to do |format|
        if @intervention.save!
          format.html { redirect_to "/interventions" }
          format.json { render :show, status: :created, location: @intervention }
          p @intervention
          p "coucou"
        else
          format.html { redirect_to "/interventions" }
          format.json { render json: @intervention.errors, status: :unprocessable_entity }
          p "wo menute"
        end
      end
    end
  
    # PATCH/PUT /quotes/1
    # PATCH/PUT /quotes/1.json
    def update
      respond_to do |format|
        if @intervention.update(intervention_params)
          format.html { redirect_to "/interventions" }
          # format.html { redirect_to quotes_url}
          format.json { render :show, status: :ok, location: @intervention }
        else
          format.html { render :edit }
          format.json { render json: @intervention.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /quotes/1
    # DELETE /quotes/1.json
    def destroy
      @intervention.destroy
      respond_to do |format|
        format.html { redirect_to "/interventions" }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_intervention
        @intervention = Intervention.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def intervention_params
        params.permit( :employee_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :intervention_result, :report, :intervention_status)
      end
  end
  
  