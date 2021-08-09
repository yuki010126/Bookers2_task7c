Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
  resource :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
  resource :relationships, only: [:create, :destroy]


  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :groups, except: [:destroy]
  get '/search', to: 'searchs#search'
end


