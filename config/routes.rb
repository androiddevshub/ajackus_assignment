Rails.application.routes.draw do
  get 'exception/show'
  root to: 'contacts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Api => '/'
end
