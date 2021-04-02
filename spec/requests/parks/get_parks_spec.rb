require 'rails_helper'

describe "get all parks route", :type => :request do
  state = FactoryBot.create(:state)
  park = Park.create({
    name: "Way Up There",
    description: "It's pretty high.",
    state_id: state.id
    })

  before { get "/states/#{state.id}/parks"}

  it 'returns all parks belonging to that state' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end