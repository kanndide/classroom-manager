Rails.application.routes.draw do
  
  root 'welcome#home'
  resources :school_users
  resources :schools
  resources :user_lectures
  resources :lectures
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
