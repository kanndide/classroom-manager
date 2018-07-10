Rails.application.routes.draw do
  
  root 'welcome#home'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  resources :schools
  resources :lectures
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
