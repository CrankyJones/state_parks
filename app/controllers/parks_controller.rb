class ParksController < ApplicationController
  swagger_controller :parks, "State Parks"
  
  swagger_api :index do
    summary "Fetches all parks for a state"
    param :path, :state_id, :integer, :required, "State ID"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end
  def index
    state = State.find(params[:state_id])
    @parks = state.parks
    json_response(@parks)
  end

  swagger_api :show do
    summary "Fetches a single park for a state"
    param :path, :state_id, :integer, :required, "State ID"
    param :path, :id, :integer, :required, "Park ID"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity, "A park with that ID does not match the state ID."
  end
  def show
    state = State.find(params[:state_id])
    @park = Park.find(params[:id])
    if state.id == @park.state_id
      json_response(@park)
    else
      render status: 404, json{ message: "This park is not in this state."}
    end
  end

  
  swagger_api :create do
    summary "Creates a new park"
    param :form, :name, :string, :required, "Name"
    param :form, :description, :string, :required, "Description"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def create
    @park = Park.create!(park_params)
    json_response(@park, :created)
  end

  swagger_api :update do
    summary "Updates an existing park"
    param :path, :state_id, :integer, :required, "State ID"
    param :path, :id, :integer, :required, "Park ID"
    param :form, :name, :string, :required, "Name"
    param :form, :description, :string, :required, "Description"
    response :ok, "This park has been updated successfully."
    response :not_found
    response :unprocessable_entity
  end
  def update
    state = State.find(params[:state_id])
    @park = Park.find(params[:id])
    if state.id == @park.state_id
      if @park.update!(park_params)
        render status: 200, json: { message: "This park has been successfully updated."}
      end
    else
      render status: 404, json{ message: "This park is not in this state."}
    end
  end

  
  swagger_api :destroy do
    summary "Deletes an existing park"
    param :path, :state_id, :integer, :required, "State ID"
    param :path, :id, :integer, :required, "Park ID"
    response :ok, "This park has been deleted successfully."
    response :not_found
    response :unprocessable_entity
  end
  def destroy
    state = State.find(params[:state_id])
    @park = Park.find(params[:id])
    if state.id == @park.state_id
      if @park.destroy!
        render status: 200, json: { message: "This park has been destroyed by a laser from space."}
      end
    else
      render status: 404, json{ message: "This park is not in this state."}
    end
  end

private
  def park_params
    params.permit(:name, :description, :state_id)
  end
end