Rails.application.routes.draw do
  get 'home/index', to: "home#index", as: :home
  root 'home#index'

  get 'formnflow', to: "formnflow#show", as: :formnflow
end
