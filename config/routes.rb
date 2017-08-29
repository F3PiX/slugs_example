Rails.application.routes.draw do

  root to: 'cities#index'

  resources :flowers
  resources :cities
  get "/:id", to: "slugs#show"
end
