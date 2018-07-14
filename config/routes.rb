Rails.application.routes.draw do
  
  root 'welcome#home'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  resources :schools, only: [:index, :show, :create, :update] do
    resources :lectures, only: [:index]
  end
  resources :lectures, only: [:show, :create, :update]
  resources :users do
  	resources :schools, only: [:new, :edit, :destroy]
  	resources :lectures, only: [:index, :new, :edit, :show, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
