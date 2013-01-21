ReferralApp::Application.routes.draw do

  resources :referrals
  resources :notes
  resources :biz_types
  resources :social_networks
  resources :addresses
  resources :phone_numbers
  resources :leads
  resources :contacts
  match "users/:id/pass_referee_to_form", to: "users#pass_referee_to_form"
  match "users/:id/pass_target_to_form", to: "users#pass_target_to_form"
  match "referrals/:id/send_referral", as: "send_referral", to: "referrals#send_referral"
  match "send_recommendation", to: "referrals#send_recommendation"

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
