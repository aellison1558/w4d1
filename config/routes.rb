Rails.application.routes.draw do

  resources :users, only: [:index, :create, :show, :destroy, :update] do
    resources :contacts, only: [:index]
  end
  
  resources :contacts, only: [:index, :create, :show, :destroy, :update]
  resources :contact_shares, only: [:create, :destroy]

  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'



end
