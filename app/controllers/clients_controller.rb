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
        @client = current_user.clients.build(client_params)
        if @client.save 
            redirect_to clients_path
        else 
            render :new
        end
    end

    def edit
        @client = current_user.clients.find(params[:id])
    end

    def update
        @client = current_user.clients.find(params[:id])
        if @client.update(client_params)
            redirect_to @client
        else
            render :edit
        end
    end

    def show
        redirect_if_not_logged_in
        @client = current_user.clients.find_by_id(params[:id])
    end

    private

    def client_params
        params.require(:client).permit(:user_id, :name, :phone_number, :email)
    end



end



