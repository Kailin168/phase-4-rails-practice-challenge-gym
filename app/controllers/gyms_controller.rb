class GymsController < ApplicationController
  before_action :find_gym, only: [:show, :destroy, :update]

def index
  render json: Gym.all
end

def update
  if @gym 
    @gym.update(params_gym)
    render json: @gym
  else 
    render json: { error: "Gym not found" }, status: 404
  end

end


def show
  if @gym
    render json: @gym
  else 
    render json: { error: "GYM NOT FOUND" }, status: 404
  end
  
end

def destroy
  if @gym 
    @gym.destroy
    render json: @gym
  else 
    render json: { error: "Gym not found" }, status: 404
  end

end


private

def find_gym
  @gym = Gym.find_by(id: params[:id])
end

def params_gym
  params.permit(:name, :address)
end


end
