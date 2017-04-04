Rails.application.routes.draw do
  root 'sessions#index'
  resources :sessions, only: %i(new create destroy)
  resources :matches
  resources :residents
  resources :organizations
  resources :volunteers



  get '/new_profile' => "volunteers#new_profile", as: :new_profile
  post '/create_profile' => 'volunteers#create_profile', as: :create_profile
  get '/new_availability' => 'volunteers#new_availability', as: :new_availability
  post '/create_availability' => 'volunteers#create_availability', as: :create_availability


  get '/new_resident_profile' => 'residents#new_profile', as: :new_resident_profile
  post '/create_resident_profile' => 'residents#create_profile', as: :create_resident_profile
  get '/new_resident_availability' => 'residents#new_availability', as: :new_resident_availability
  post '/create_resident_availability' => 'residents#create_availability', as: :create_resident_availability
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/get_matches' => "matches#get_matches", as: :get_matches
  get '/show_match/:id' => "matches#show_match", as: :show_match
end
