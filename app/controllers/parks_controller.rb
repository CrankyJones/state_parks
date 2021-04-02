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
    @park = Park.create!(park_params)
    json_response(@park)
  end

  def update
    @park = Park.find(params[:id])
    if @park.update!(park_params)
      render status: 200, json: { message: "This park has been successfully updated."}
    end
  end

  def destroy
    @park = Park.find(params[:id])
    if @park.destroy!
      render status: 200, json: { message: "This park has been destroyed by a laser from space."}
    end
  end

private
  def park_params
    params.permit(:name, :description, :state_id)
  end
end