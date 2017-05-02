Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # when going to the landing page
  #   it will route to the HomeController, index action
  root to: "home#index"
  get "/sign-in" => "sessions#sign_in_form", as: "sign_in"
  post "/sign-in" => "sessions#sign_in"
  delete "/sign-out" => "sessions#sign_out", as: "sign_out"
  # get "/search-response" => "search#response"

  # this command...
  resources :users

  resources :posts do
    resources :comments, only: [:index, :show]
  end

  # will generate the following routes for you
  # get "/users" => "users#index"
  # post "/users" => "users#create"
  # get "/users/new" => "users#new"
  # get "/users/:id/edit" => "users#edit"
  # get "/users/:id" => "users#show"
  # put "/users/:id" => "users#update"
  # delete "/users/:id" => "users#destroy"
end
