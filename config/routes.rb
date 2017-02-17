Rails.application.routes.draw do
  
  get 'users/new'
  post 'users/create'

  devise_for :users, except: [:registrations] do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    put 'users' => 'devise/registrations#update', :as => 'user_registration'            
  end
  resources :users, except: [:create] do
    collection do
      post '/create', to: 'users#create', as: :create
    end
  end

  resources :owner_salary_components
  resources :erp_operating_expenses
  resources :sunshine_center_other_expenses
  resources :utility_expenses
  resources :marketing_fixed_expenses
  resources :company_lease_informations
  resources :houses
  resources :revenues
  resources :payroll_datas
  resources :digital_marketing_datas
  resources :miscellaneous_expenses
  resources :companies do
    member do 
      get '/revenues-n-expenses/year-selection', to: 'companies#revenues_year_selection'
      get '/:year/revenues-n-expenses', to: 'companies#yearly_revenue_n_expenses'
    end
  end
  
  
  namespace :api do
    namespace :v1 do
      post '/revenues', to: 'revenues#create'
    end
  end    

  get '/expenses_n_revenues', to: 'dashboards#expenses_n_revenues', as: :expenses_n_revenues
  get '/landing_page', to: 'dashboards#landing_page'
  root 'dashboards#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
