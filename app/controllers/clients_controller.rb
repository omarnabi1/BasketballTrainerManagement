class ClientsController < ApplicationController

    
    def new 
        @client = Client.new
    end
    
    def create 
        @client = Client.new
    if @client.user = current_user
        @client.save 
            redirect_to clients_path
    else 
        render :new
    end
    end


end
