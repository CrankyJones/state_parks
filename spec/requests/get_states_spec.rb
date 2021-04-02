require 'rails_helper'

describe "get all states route", :type => :request do
  let!(:states) { FactoryBot.create_list(:state, 20)}

  before { get '/states'}

  it 'returns all states' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end