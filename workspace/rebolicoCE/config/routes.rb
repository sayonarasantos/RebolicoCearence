Rails.application.routes.draw do
  # root 'welcome/index'
  # get 'welcome/index'
  root 'welcome#index'
  get '/welcome' => 'welcome#index' 
  
  # root 'albums#index'
  get '/events' => 'events#index'
  get '/events/new' => 'events#new'
  get '/events/:id' => 'events#show', as: :event
  post '/events' => 'events#create'
  resources :events


  
  get 'signup'  => 'users#new'
  get '/users/:id' => 'users#show', as: :user
  resources :users
  
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # get '/about' => 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
