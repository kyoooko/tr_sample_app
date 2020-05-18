Rails.application.routes.draw do


  # root 'static_pages#home'
  # get 'static_pages/contact'
  # get 'static_pages/home'
  # get 'static_pages/help'
  # get 'static_pages/about'

  root 'static_pages#home' 
  get  '/help',    to: 'static_pages#help'
  # 演習get  '/help',    to: 'static_pages#help', as: "helf"
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  # 5-4-2でget 'users/new'を下記に書き換え/また/users/newと/signupどっちでもサインアップページ表示
  get  '/signup',    to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  
end
