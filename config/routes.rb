Rails.application.routes.draw do
  
  root 'welcome#home'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  resources :school_users
  resources :schools
  resources :user_lectures
  resources :lectures
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
