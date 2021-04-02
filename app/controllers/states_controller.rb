class StatesController < ApplicationController
  swagger_controller :states, "States"
  

  swagger_api :index do
    summary "Fetches all states"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def index
    @states = State.all
    json_response(@states)
  end

  swagger_api :show do
    summary "Fetches a specific state"
    param :path, :id, :integer, :required, "State ID"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def show
    @state = State.find(params[:id])
    json_response(@state)
  end

  swagger_api :create do
    summary "Creates a new state"
    param :form, :name, :string, :required, "Name"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end  
  def create
    @state = State.create!(state_params)
    json_response(@state, :created)
  end

  swagger_api :update do
    summary "Updates a state name"
    param :path, :id, :integer, :required, "State ID"
    param :form, :name, :string, :required, "New name"
    response :ok, "This state has been updated successfully."
    response :not_found
    response :unprocessable_entity, "Validation failed: Name cannot be blank."
  end
  def update
    @state = State.find(params[:id])
    if @state.update(state_params)
      render status: 200, json: { message: "This state has been updated successfully!"}
    end
  end

  swagger_api :destroy do
    summary "Deletes a state"
    param :path, :id, :integer, :optional, "State Id"
    response :unauthorized
    response :not_found
  end
  def destroy
    @state = State.find(params[:id])
    if @state.destroy!
      render status: 200, json: { message: "This state and all its parks have been successfully removed off the face of the planet."}
    end
  end

private
  def state_params
    params.permit(:name)
  end
end