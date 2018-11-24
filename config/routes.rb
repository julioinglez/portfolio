Rails.application.routes.draw do
  get 'home/index', to: "home#index", as: :home
  root 'home#index'

  get 'formnflow', to: 'formnflow#show'
  get 'hatcher', to: 'hatcher#show'
  get 'nexus_pattern', to: 'nexus_pattern#show'
  get 'speedy_vocab', to: 'speedy_vocab#show'
end
