class AppointmentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :current_user

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @appointment = @user.appointments.build
        else 
            @appointment = Appointment.new
        end
    end

    
    def create
        @appointment = current_user.appointments.create(appointment_params)
        binding.pry
        if @appointment.save
            redirect_to appointments_path
        else
            render :new
        end
    end

    private

    def appointment_params
        params.require(:appointment).permit(:user_id,:appointment_time,:duration,:price, client_attributes:[:name, :phone_number, :email], location_attributes:[:nickname, :city, :street_address, :state, :zipcode])
    end

end
