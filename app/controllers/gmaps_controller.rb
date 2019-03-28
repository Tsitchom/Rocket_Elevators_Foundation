class GmapsController < ApplicationController
  before_action :set_gmap, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def mapsAPI

		@buildings = Building.all
		@markers = []

		Building.find_each do |building|
			#id = building.id
			address = building.address
			customer = building.customer.company_name #probably cant go through customer in Building.find_each
			batteries = building.batteries.count
			battery_ids = building.battery_ids
			columns = Column.where(battery_id: battery_ids).count
			column_ids = Column.where(battery_id: building.battery_ids).ids
			elevators = Elevator.where(column_id: column_ids).count
			contact = building.customer.full_name_service_person

			
			  if !address.latitude		

				#Then I want to take that info from DB and parse it into a JSON for my maps API ... 
				  @full_add = address.number_street + " " + address.city + " " + address.postal_code
				  @response = JSON.parse(Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@full_add}&key=#{ENV["GOOGLE_API"]}").body)
				
			  pp address
			  pp  @response

				  lat = @response["results"][0]["geometry"]["location"]["lat"]
				  lng = @response["results"][0]["geometry"]["location"]["lng"]
				
				  address.latitude = lat
				  address.longitude = lng
				  address.save!
				  # sleep(2)
			  end
			
			  @markers << {address: address.display_address, lat: address.latitude, lng: address.longitude, customer: customer, batteries: batteries, columns: columns, elevators: elevators, contact: contact }
		  end
	  end
  
  # GET /gmaps
  # GET /gmaps.json
  def index
    @gmaps = Gmap.all
  end

  # GET /gmaps/1
  # GET /gmaps/1.json
  def show
  end

  # GET /gmaps/new
  def new
    @gmap = Gmap.new
  end

  # GET /gmaps/1/edit
  def edit
  end

  # POST /gmaps
  # POST /gmaps.json
  def create
    @gmap = Gmap.new(gmap_params)

    respond_to do |format|
      if @gmap.save
        format.html { redirect_to @gmap, notice: 'Gmap was successfully created.' }
        format.json { render :show, status: :created, location: @gmap }
      else
        format.html { render :new }
        format.json { render json: @gmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gmaps/1
  # PATCH/PUT /gmaps/1.json
  def update
    respond_to do |format|
      if @gmap.update(gmap_params)
        format.html { redirect_to @gmap, notice: 'Gmap was successfully updated.' }
        format.json { render :show, status: :ok, location: @gmap }
      else
        format.html { render :edit }
        format.json { render json: @gmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gmaps/1
  # DELETE /gmaps/1.json
  def destroy
    @gmap.destroy
    respond_to do |format|
      format.html { redirect_to gmaps_url, notice: 'Gmap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gmap
      @gmap = Gmap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gmap_params
      params.fetch(:gmap, {})
    end
end
