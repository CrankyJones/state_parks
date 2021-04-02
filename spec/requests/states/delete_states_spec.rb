require 'rails_helper'

describe 'post a state route', :type => :request do

  before do
    @state = FactoryBot.create(:state)
    delete "/states/#{@state.id}"
  end

  it "returns the state name" do
    expect(JSON.parse(response.body)['message']).to eq("This state and all its parks have been successfully removed off the face of the planet.")
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end