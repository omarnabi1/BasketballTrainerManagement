class ClientsController < ApplicationController

    
    def index
        if params[:appointment_id]
            @clients = @user.clients
        else
            @clients = current_user.clients.all
        end   
    end
    
    def new 
        @client = Client.new
    end
    
    def create 
        @client = current_user.Client.new(client_params)
        client.user ||= current_user if client.new_record?
        if @client.save 
            redirect_to clients_path
        else 
        render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @client = current_user.clients.find_by_id(params[:id])
    end

    private

    def client_params
        params.require(:client).permit(:content,:appointment_id)
    end



end



