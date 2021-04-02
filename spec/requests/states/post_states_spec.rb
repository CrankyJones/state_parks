require 'rails_helper'

describe 'post a state route', :type => :request do

  before do
    post '/states',
      params: {
        name: "Of Mind"
      }
  end

  it "returns the state name" do
    expect(JSON.parse(response.body)['name']).to eq('Of Mind')
  end


  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end