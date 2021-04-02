require 'rails_helper'

describe "update states route", :type => :request do
  
  before do
    @state = FactoryBot.create(:state)
    put "/states/#{@state.id}", params: { name: "Of Mind" }
  end

  it 'returns updated name' do
    expect(State.find(@state.id).name).to eq('Of Mind')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end