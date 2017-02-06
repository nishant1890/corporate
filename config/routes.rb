Rails.application.routes.draw do
  
  get 'users/new'
  post 'users/create'

  resources :owner_salary_components
  resources :erp_operating_expenses
  resources :sunshine_center_other_expenses
  resources :utility_expenses
  resources :marketing_fixed_expenses
  resources :company_lease_informations
  resources :houses
  resources :revenues
  resources :expenses
  devise_for :users
  
  get '/expenses_n_revenues', to: 'dashboards#expenses_n_revenues', as: :expenses_n_revenues
  get '/landing_page', to: 'dashboards#landing_page'
  root 'dashboards#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
