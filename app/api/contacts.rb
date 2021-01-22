class Contacts < Api
	format :json
  default_format :json
  
   helpers do
    def contact_params
      @permitted_params ||= declared(params, include_missing: false, include_parent_namespaces: false)
    end
  end

	namespace :contacts, desc: 'Bags related CRUD operations' do

    desc 'A test end-point'
    get '/test_endpoint' do
      { message: "Hello, I am testing end-point", status_code: true }
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
      requires :user, type: Hash do
        requires :first_name, type: String, desc: 'First name'
        requires :last_name, type: String, desc: 'Last name'
        requires :email, type: String, desc: 'Email'
        requires :phone, type: String, desc: 'Phone'
        requires :message, type: String, desc: 'Message'
      end
      
    end
    post '/' do
      @contact = Contact.new(contact_params[:user])
      if @contact.save! && @contact.send_mail
        { data: @contact, message: 'Contact was successfully added.', status_code: true}
      else
        error!({ status_code: false, message: @contact.errors.full_messages.join(', ') }, 400)
      end
    end
    
    
	

	
	end
end