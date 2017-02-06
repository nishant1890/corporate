Rails.application.routes.draw do
  resources :company_lease_informations
  resources :houses
  resources :revenues
  resources :expenses
  resources :company_names
  devise_for :users
  
  get '/company_landing_page', to: 'dashboards#company_landing_page', as: :company_landing_page
  root 'dashboards#company_landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
