class MembershipsController < ApplicationController

def create
  member = Membership.create!(params_member)
  render json: member
end

private

def params_member
  params.permit(:gym_id, :client_id, :charge)
end


end
