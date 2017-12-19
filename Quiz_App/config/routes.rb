Rails.application.routes.draw do
  
  get 'questions/new'

  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/users/new' => 'users#new'
  post '/users/create' => 'users#create'
  get '/users/:id/edit' => 'users#edit'
  delete '/users/:id' => 'users#destroy'
  put '/users/:id' => 'users#update'
  get '/users' => 'users#index'
  get '/users/leaderboard' => 'users#leaderboard'
  
  get '/questions/' => 'questions#index'
  get '/questions/new' => 'questions#new'
  post '/questions/create' => 'questions#create'
  get '/questions/:id/edit' => 'questions#edit'
  #get '/questions/:id' => 'questions#destroy'
  
  get '/play/' => 'play#show'
  post '/play/update' => 'play#update'
  get '/play/complete' => 'play#complete'

  get '/genres/new' => 'genres#new'
  post '/genres/create' => 'genres#create'
  get '/genres/leaderboard' => 'genres#leaderboard'
  #get '/genres/:id' => 'genres#destroy'

  get '/sub_genres/new' => 'sub_genres#new'
  post '/sub_genres/create' => 'sub_genres#create'
  get '/sub_genres/:id' => 'sub_genres#show'

  resources :users, :sessions, :play 
  resources :genres, :subgenres
  resources :questions, :only => [:create, :show, :destroy]

  root to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
