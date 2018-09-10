Rails.application.routes.draw do
  
  root 'welcome#home'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post '/add_to_schedule', to: 'user_lectures#create' #There is probably a better way to do this
  post '/remove_from_schedule', to: 'user_lectures#destroy' #There is probably a better way to do this
  get 'schools/most_lectures', to: 'schools#most_lectures'
  resources :schools, only: [:index, :show, :create, :update, :destroy] do
    resources :lectures, only: [:index]
  end
  resources :lectures, only: [:index, :show, :create, :update, :destroy]
  resources :users do
  	resources :schools, only: [:new, :edit]
  	resources :lectures, only: [:new, :edit, :show]
    resources :school_users, only: [:new]
  end
  resources :school_users, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
