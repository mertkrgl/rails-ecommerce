Rails.application.routes.draw do

  get 'pages/home'
  root 'sessions#new'

  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  get 'home', to: 'pages#home'

  resources :products

  get 'pages/home'

  get 'cart' , to: 'carts#show'
  post 'cart/add' , to:'carts#add' 
  delete 'cart/destroy/:product_id' , to: 'carts#destroy' , as: 'cart_destroy' #form kullanmamak için :product_id kullandık.

end
