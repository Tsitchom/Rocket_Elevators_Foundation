class PagesController < ApplicationController

  	before_action :authenticate_user!, only: [:mapsAPI]
	
	def index
		@lead = Lead.new
	end

	def gform
		@quote = Quote.new
	end

	def residential
	end

	# The method in which the GEOLOCATION part of the website is managed : the geocoding of the addresses are put in an array and sent in the mapsAPI page from #pages
	def mapsAPI
		@buildings = Building.all
		@markers = []

		Building.find_each do |building|
			address = building.address
			customer = building.customer.company_name 
			batteries = building.batteries.count
			battery_ids = building.battery_ids
			columns = Column.where(battery_id: battery_ids).count
			column_ids = Column.where(battery_id: building.battery_ids).ids
			elevators = Elevator.where(column_id: column_ids).count
			contact = building.customer.full_name_service_person

				building.batteries.all.each do |battery|
					number_of_floors = battery.columns.first.number_of_floors

				p number_of_floors
			
				if !address.latitude		

			
					@full_add = address.number_street + " " + address.city + " " + address.postal_code
					@response = JSON.parse(Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@full_add}&key=#{ENV["GOOGLE_API"]}").body)
				

			pp address
			pp  @response

			    if @response["results"].size != 0 	
					lat = @response["results"][0]["geometry"]["location"]["lat"]
					lng = @response["results"][0]["geometry"]["location"]["lng"]
				
					address.latitude = lat
					address.longitude = lng
					address.save!
				end
				end
				unless address.longitude.nil?
				@markers << {address: address.display_address, lat: address.latitude, lng: address.longitude, customer: customer, batteries: batteries, columns: columns, elevators: elevators, contact: contact, number_of_floors: number_of_floors }
				end
			end
		end
	end
end 
