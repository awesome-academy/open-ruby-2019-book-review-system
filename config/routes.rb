Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    root "static_pages#home"
    get "/login", to: "sessions#new"
    get "/signup", to: "users#new"
  end
end
