class ParksController < ApplicationController
  def index
    state = State.find(params[:state_id])
    @parks = state.parks
    json_response(@parks)
  end

  def show
    state = State.find(params[:state_id])
    @park = Park.find(params[:id])
    json_response(@park)
  end

  def create
    state = State.find(params[:state_id])
    @park = Park.create!(park_params)
    json_response(@park)
  end



private
end