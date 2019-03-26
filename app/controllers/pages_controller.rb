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
		address = building.address
		customer = building.customer.company_name #probably cant go through customer in Building.find_each
		batteries = building.batteries.count
		battery_ids = building.battery_ids
		columns = Column.where(battery_id: battery_ids).count
		column_ids = Column.where(battery_id: building.battery_ids).ids
		elevators = Elevator.where(column_id: column_ids).count
		contact = building.customer.full_name_service_person

		#Then I want to take that info from DB and parse it into a JSON for my maps API ... 

	end
end
end

