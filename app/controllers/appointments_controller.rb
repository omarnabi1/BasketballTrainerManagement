class AppointmentsController < ApplicationController
    
    #before_action :redirect_if_not_logged_in
    before_action :current_user

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @appointment = @user.appointments.build
        elsif params[:client_id] && @client = current_user.clients.find_by(id: params[:client_id])
            @appointment = @client.appointments.build
        elsif params[:location_id] && @location = current_user.locations.find_by(id: params[:location_id])
            @appointment = @location.appointments.build
        else
            @appointment = Appointment.new
        end
    end


    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @appointments = @user.appointments.alpha
        elsif params[:client_id] && @client = Client.find_by_id(params[:client_id])
            @appointments = @client.appointments.order(:date)
        elsif params[:location_id] && @location = Location.find_by_id(params[:location_id])
            @appointments = @location.appointments
        else
            @appointments = current_user.appointments.alpha
        end
        
    end

    
    def create
        @appointment = current_user.appointments.build(appointment_params)
        if @appointment.save
            redirect_to appointments_path
        else
            render :new
        end
    end

    def edit
        @appointment = Appointment.find_by_id(params[:id])
        redirect_to appointments_path if !@appointment || @appointment.user != current_user
    end

    def show
        @appointment = Appointment.find_by_id(params[:id])
    end

    def update 
        @appointment = Appointment.find_by_id(params[:id])
        redirect_to to appointments_path if !@appointment || @appointment.user != current_user
        if @appointment.update(appointment_params)
            redirect_to appointment_path(@appointment)
        else
            render :edit
        end
    end

    def destroy 
        @appointment = Appointment.destroy(params[:id])
        redirect_to appointments_path
    end

    private

    def appointment_params
        params.require(:appointment).permit(:user_id,:time,:date,:price, client_attributes:[:user_id, :name, :phone_number, :email, :id], location_attributes:[:user_id, :nickname, :city, :street_address, :state, :zipcode, :id])
    end

end
