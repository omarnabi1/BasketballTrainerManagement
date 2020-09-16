class AppointmentsController < ApplicationController
    
    #before_action :redirect_if_not_logged_in
    before_action :current_user

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @appointment = @user.appointments.build
        else 
            @appointment = Appointment.new
        end
    end


    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @appointments = @user.appointments.alpha
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

    private

    def appointment_params
        params.require(:appointment).permit(:user_id,:time,:date,:price, client_attributes:[:user_id, :name, :phone_number, :email], location_attributes:[:user_id, :nickname, :city, :street_address, :state, :zipcode])
    end

end
