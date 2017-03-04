Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: %i(new create destroy)
  resources :matches
  resources :pwds
  resources :organizations
  resources :volunteers

  get '/new_profile' => "volunteers#new_profile", as: :new_profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
