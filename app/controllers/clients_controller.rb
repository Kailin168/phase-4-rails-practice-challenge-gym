class ClientsController < ApplicationController
  before_action :find_client, only: [:show, :update]

  def show
    if @client
      render json: @client, include: :memberships, :methods => :find_total_cost
    else 
      render json: { error: "client NOT FOUND" }, status: 404
    end
    
  end
  
  def index
    render json: Client.all
  end
  
  def update
    if @client 
      @client.update(params_client)
      render json: @client
    else 
      render json: { error: "client not found" }, status: 404
    end
  
  end

  private
  
  def find_client
    @client = Client.find_by(id: params[:id])
  end


  def params_client
    params.permit(:name, :age)
  end
  

end
