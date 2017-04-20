Rails.application.routes.draw do


  root 'sessions#index'

  # This is for logging in and logging out
  post 'sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'

  # This is to register a new user or edit their information
  post 'users' => 'users#create'
  get 'users/:id/edit' => "users#edit"
  patch 'users/:id' => "users#update"

  # Shows event dashboard and event show
  get 'events' => 'events#index'
  get 'events/:id' => 'events#show'
  post 'events' => 'events#create'
  delete 'events/:id' => 'events#destroy'
  get 'events/:id/edit' => "events#edit"
  patch 'events/:id' => "events#update"

  # This is kind of liking and unliking
  post 'attendees' => 'attendees#create' # This wil be called Join
  delete 'attendees/:id' => 'attendees#destroy' # This will be called Cancel

  # You can only create comments
  post 'comments' => 'comments#create' 



end
