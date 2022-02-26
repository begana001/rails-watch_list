Rails.application.routes.draw do
  root to: 'lists#home'
  resources :movies, only: [:index, :show] do
    resources :movie_reviews
  end
  resources :lists do
    resources :bookmarks
    resources :list_comments
  end
end
