require 'rails_helper'

describe 'post a park route', :type => :request do

  before do
    state = FactoryBot.create(:state)
    post "/states/#{state.id}/parks",
      params: {
        name: "Big Park",
        description: "Meh, it's an okay size."
      }
  end

  it "returns the park name" do
    expect(JSON.parse(response.body)['name']).to eq('Big Park')
  end
  it "returns the park description" do
    expect(JSON.parse(response.body)['description']).to eq("Meh, it's an okay size.")
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end