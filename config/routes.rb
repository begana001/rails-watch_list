Rails.application.routes.draw do
  root to: 'lists#home'
  resources :movies, only: [:index, :show]
  resources :lists do
    resources :bookmarks
  end
end
