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
  
end
