class PagesController < ApplicationController

	def index
		@lead = Lead.new
	end
	def gform
		@quote = Quote.new
	end
	def residential
	end

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

		if address.longitude.nil? 
		#Then I want to take that info from DB and parse it into a JSON for my maps API ... 
		@full_add = address.number_street + " " + address.city + " " + address.postal_code
		@response = JSON.parse(Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@full_add}&key=AIzaSyBps-kX8grkxiSLBr0Q7sKOL9Z2G9UwKWg").body)
		p "Hello"
		p @full_add
		p @response

		lat = @response["results"][0]["geometry"]["location"]["lat"]
		lng = @response["results"][0]["geometry"]["location"]["lng"]
		
		address.latitude = lat
		address.longitude = lng
		address.save!
		sleep(2)
		end
		
		@markers << {address: address, lat: lat, lng: lng, customer: customer, batteries: batteries, columns: columns, elevators: elevators, contact: contact }
	end
end
end

