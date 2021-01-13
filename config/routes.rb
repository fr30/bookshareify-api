Rails.application.routes.draw do
  resources :bookshelves
  resources :books
  resources :bookshelf_books, except: [:update, :destroy]
  resource :users, only: [:create, :update]
  resource :bookshelf_books, only: :destroy
  resource :sessions, only: [:create, :destroy]

  get 'profile', to: 'users#show'

  match '*path', to: 'application#not_found', via: :all
end
