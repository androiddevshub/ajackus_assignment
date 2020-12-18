class Contacts < Api
	format :json
	default_format :json

	namespace :contacts, desc: 'Bags related CRUD operations' do

    desc 'A test end-point'
    get '/test' do
      { status_code: true,  message: 'Test api response successful' }
		end

		desc 'Get all Contacts'
    get '/' do
      @contacts = Contact.all
      if @contacts
        { data: @contacts, status_code: true }
      else
        error!({ status_codes: false, message: 'Contact list is empty' }, 400)
      end
		end

    desc 'Create new contact'
    params do
      requires :first_name, type: String, desc: 'First name'
      requires :last_name, type: String, desc: 'Last name'
      requires :email, type: String, desc: 'Email'
      requires :phone, type: String, desc: 'Phone'
      requires :message, type: String, desc: 'Message'
    end
    post '/' do
      @contact = Contact.new(params)
      if @contact.save!
        { data: @contact, message: 'Contact was successfully added.', status_code: true}
      else
        error!({ status: false, message: @contact.errors.full_messages.join(', ') }, 400)
      end
		end
	

	
	end
end