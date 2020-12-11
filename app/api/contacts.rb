class Contacts < Api
	format :json
	default_format :json

	namespace :contacts, desc: 'Bags related CRUD operations' do

		desc 'Contacts'
		get '/' do
      {status: true, message: "Yeah, you are here"}
		end

	

	
	end
end