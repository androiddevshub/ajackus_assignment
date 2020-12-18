require 'rails_helper'

describe "form submission enpoints", :type => :request do

  it 'GET test endpoint returns to test code true' do
    get '/api/contacts/test'
    expect(JSON.parse(response.body)['status_code']).to eq(true)
  end

  it 'GET /api/contacts returns status code to be true and data to be empty ' do
    get '/api/contacts'
    expect(JSON.parse(response.body)['status_code']).to eq(true)
    expect(JSON.parse(response.body)['data']).to eq([])
  end


  it 'POST /api/contacts returns status code as true' do
    post '/api/contacts', :params => { first_name: "hey maah", last_name: "man", email: "heymaah@man.com", phone: "5656787890", message: "Hey maah man, its been too long we met" }
    expect(JSON.parse(response.body)['status_code']).to eq(true)
  end

  it 'POST /api/contacts returns error' do
    post '/api/contacts', :params => { first_name: "hey maah", last_name: "man", email: "heymaah@man.com"}
    expect(JSON.parse(response.body)['error']).to eq("phone is missing, message is missing")
  end

end
  