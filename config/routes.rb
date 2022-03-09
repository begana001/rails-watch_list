Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#home'
  get 'myprofile', to: 'lists#profile', as: :myprofile
  resources :movies, only: [:index, :show] do
    resources :movie_reviews
  end
  resources :lists do
    resources :bookmarks
    resources :list_comments
  end
end
