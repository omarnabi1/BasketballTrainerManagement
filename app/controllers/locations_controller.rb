class LocationsController < ApplicationController

    def new 
        @location = Location.new
    end

    def index
        @locations = current_user.locations
    end

    def show
        @location = current_user.locations.find(params[:id])
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
    
    def edit
        @location = current_user.locations.find(params[:id])
    end

    def update
        @location = current_user.locations.find(params[:id])
        if @location.update(location_params)
            redirect_to @location
        else
            render :edit
        end
    end

    private

    def location_params
        params.require(:location).permit(:nickname, :city, :street_address, :state, :zipcode)
    end

end
