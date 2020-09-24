class Appointment < ApplicationRecord
    belongs_to :location
    belongs_to :user
    belongs_to :client
    
    accepts_nested_attributes_for :client
    accepts_nested_attributes_for :location


    def client_attributes=(attributes)
        if client = Client.find_by_id(attributes[:id])
            client.assign_attributes(attributes)
        else
            client = Client.new(attributes)  
        end
            client.appointments << self 
    end

    def location_attributes=(attributes)
        if location = Location.find_by(id: attributes[:id])
            location.assign_attributes(attributes)
        else
            location = Location.new(attributes)
        end
            location.appointments << self
    end


    scope :alpha, -> { includes(:client).order('clients.name') }

end
