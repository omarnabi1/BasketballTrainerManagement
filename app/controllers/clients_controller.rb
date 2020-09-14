class ClientsController < ApplicationController

    
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



