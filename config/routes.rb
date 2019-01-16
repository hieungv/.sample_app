Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi|ja/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/login", to: "static_pages#login"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/new", to: "users#new"
  end
end
