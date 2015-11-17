Rails.application.routes.draw do

  resources :users, only: [:index, :create, :show, :destroy, :update] do
    resources :contacts, only: [:index]
    resources :comments, only: [:index]
    get 'favorites', to: 'users#favorite'
    resources :groups, only: [:index]

  end

  resources :contacts, only: [:index, :create, :show, :destroy, :update] do
    resources :comments, only: [:index]
  end
  patch 'contacts/:id/favorite', to: 'contacts#favorite'
  patch 'contact_shares/:id/favorite', to: 'contact_shares#favorite'
  resources :contact_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :groups, only: [:create, :destroy]
  resources :group_memberships, only: [:create, :destroy]

  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'



end
