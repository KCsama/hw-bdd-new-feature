Rottenpotatoes::Application.routes.draw do
  resources :movies
  #### Part 2 ####
  # Add restful routes here
  # hint: get '', to: '', as: ''
  # Your code here #
  root :to => redirect('/movies')
  get '/movies/:id/similar', to: 'movies#show_by_director', as: :show_by_director
end
