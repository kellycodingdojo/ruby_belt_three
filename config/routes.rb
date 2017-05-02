Rails.application.routes.draw do
  root 'users#main'

  get 'bright_ideas' => 'ideas#bright_ideas'
  get 'idea_page' => 'ideas#show'
  post '/register' => 'users#create'
  post '/login' => 'sessions#create'
 
  delete '/sessions/:id' => 'sessions#destroy'
  post "/ideas" => 'ideas#create'
  post "users/:id" => 'users#show'
  post '/likes' => 'likes#create'
  get 'users/:id' => 'users#show'
  # post '/idea_page/:id' => 'ideas#idea_page'
  # get '/idea_page/:id' => 'ideas#idea_page'
  get '/bright_ideas/:id' => 'ideas#show'
  post '/bright_ideas/:id' => 'ideas#show'

  get '/idea_page/:id' => 'ideas#show'
  # delete  '/destroy/:id'  => 'ideas#destroy'
end
