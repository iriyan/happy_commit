Rails.application.routes.draw do

  get 'rails/generate'
  get 'rails/migration'
  get 'rails/rename_fight_id_column_to_fights'
  get 'comments/create'
  get 'comments/destroy'

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  post "fights/:goal_id/create" => "fights#create"
  post "fights/:goal_id/destroy" => "fights#destroy"
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  get "users/:id/likes" => "users#likes"
  get "users/:id/goals" => "users#goals"
 
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "goals/index" => "goals#index"
  get "goals/new" => "goals#new"
  get "goals/:id" => "goals#show"
  post "goals/create" => "goals#create"
  get "goals/:id/edit" => "goals#edit"
  post "goals/:id/update" => "goals#update"
  post "goals/:id/destroy" => "goals#destroy"

  resources :posts, except: [:index] do
    resources :comments, only: [:create, :destroy]
  end
  
  get "/" => "home#top"
  get "about" => "home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
