Rails.application.routes.draw do
  root 'sessions#index'
  resources :sessions, only: %i(new create destroy)
  resources :matches
  resources :pwds
  resources :organizations
  resources :volunteers

  get '/new_profile' => "volunteers#new_profile", as: :new_profile
  post '/create_profile' => 'volunteers#create_profile', as: :create_profile
  get '/new_availability' => 'volunteers#new_availability', as: :new_availability
  post '/create_availability' => 'volunteers#create_availability', as: :create_availability
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
