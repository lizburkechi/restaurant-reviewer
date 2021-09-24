Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :restaurants, param: :slug
      resources :reviews, only: [:create, :destroy]
    end
  end

  #wrong paths route back to index
  get '*path', to: 'pages#index', via: :all
end
