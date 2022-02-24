Rails.application.routes.draw do
  root to: 'lists#home'
  resources :movies, only: [:index]
  resources :lists do
    resources :bookmarks
  end
end
