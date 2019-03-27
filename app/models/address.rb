class Address < ApplicationRecord
    before_save :geocode

    geocoded_by :address_for_geocoding, :latitude  => :lat, :longitude => :lng
    
    def name
        number_street
    end
  
    def address_for_geocoding
  
       # récupérez ici votre adresse concaténée
  
    end

    def display_address
        self.number_street + " " + self.city + " " + self.postal_code
    end
  
end
