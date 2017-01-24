Rails.application.routes.draw do
  resources :customers

  root 'sessions#new'

  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'forgot_password' => 'sessions#forgot_password', as: 'forgot_password'
  post 'forgot_password' => 'sessions#reset_password', as: 'reset_password'
  get 'order/filter' => 'orders#filter', as: :order_filter
  get 'customer/filter' => 'customers#filter_customer', as: :filter_customer
  get 'user/role' => "users#role_filter"
  get 'customer/franchise' => 'customers#franchise_user'
  resources :orders do
    collection do 
      post :import
      get :import
      put :bulkupdate
    end
  end
  resources :products
  resources :users  
  resources :sessions

end
