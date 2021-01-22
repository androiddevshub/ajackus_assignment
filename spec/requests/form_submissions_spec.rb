require 'rails_helper'

describe "form submission enpoints", :type => :request do

  it 'GET test endpoint returns to test code true' do
    get '/api/contacts/test_endpoint'
    expect(JSON.parse(response.body)['status_code']).to eq(true)
  end

  it 'GET /api/contacts returns status code to be true and data to be empty ' do
    get '/api/contacts'
    expect(JSON.parse(response.body)['status_code']).to eq(true)
    expect(JSON.parse(response.body)['data']).to eq([])
  end


  it 'POST /api/contacts returns status code as true' do
    post '/api/contacts', :params => { user: {first_name: "Jack", last_name: "mortan", email: "jackmortan@gmail.com", phone: "5656787890", message: "Hey Mortan, its been too long we met"} }
    expect(JSON.parse(response.body)['status_code']).to eq(true)
  end

  it 'POST /api/contacts returns error' do
    post '/api/contacts', :params => { user: {first_name: "Jack", last_name: "Mortan", email: "jackmortan@gmail.com"}}
    expect(JSON.parse(response.body)['error']).to eq("user[phone] is missing, user[message] is missing")
  end


end
  