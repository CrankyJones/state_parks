require 'rails_helper'

describe 'post a park route', :type => :request do

  before do
    @state = FactoryBot.create(:state)
    @park = Park.create(
      name: "Big Park",
      description: "Meh, it's an okay size.",
      state_id: @state.id
    )
    put "/states/#{@state.id}/parks/#{@park.id}", params: { name: "Okay Park" }
  end

  it "returns the park name" do
    expect(Park.find(@park.id).name).to eq("Okay Park")
  end
  it "returns the park description" do
    expect(Park.find(@park.id).description).to eq("Meh, it's an okay size.")
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end