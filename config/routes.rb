Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'books/new'
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    root "static_pages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    resources :users
    resources :books, only: [:show, :new, :create]
    resources :posts, only: [:show, :new, :create]
  end
end
