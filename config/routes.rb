ReferralApp::Application.routes.draw do

  resources :referrals
  resources :notes
  resources :biz_types
  resources :social_networks
  resources :addresses
  resources :phone_numbers
  resources :leads
  resources :contacts

  match 'about', to: 'Static_pages#about'
  match 'profile', to: 'Static_pages#profile'
  match 'home', to: 'Static_pages#home'
  
  match 'signup', to: 'Users#new'
  match 'logout', to: 'sessions#destroy'
  match 'login', to: 'sessions#new'

  resources :users
  resources :sessions
  resources :password_resets

  root to: 'Static_pages#home'
end
