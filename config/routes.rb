Rails.application.routes.draw do
  resources :bookshelves
  resources :books
  resources :bookshelf_books, except: [:update, :destroy]
  resource :bookshelf_books, only: :destroy
end
