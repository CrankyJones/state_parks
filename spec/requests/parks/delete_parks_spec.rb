require 'rails_helper'

describe 'post a state route', :type => :request do

  before do
    @state = FactoryBot.create(:state)
    @park = Park.create(
      name: "Big Park",
      description: "Meh, it's an okay size.",
      state_id: @state.id
    )
    delete "/states/#{@state.id}/parks/#{@park.id}"
  end

  it "returns the state name" do
    expect(JSON.parse(response.body)['message']).to eq("This park has been destroyed by a laser from space.")
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end