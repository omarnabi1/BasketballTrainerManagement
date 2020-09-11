class LocationsController < ApplicationController

    def new 
    @location = Location.new
    end

    def create 
    @location = Location.new(location_params)
    if @location.valid?
        @location.user = current_user
        @location.save 
            redirect_to locations_path
    else 
        render :new
    end
    

end
