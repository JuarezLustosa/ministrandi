Ministrandi::Application.routes.draw do
  
  namespace :feedstocks do
    get :print_inventory
    get :list_critic_stock

    resources :outputs do
      resource :finish, controller: 'outputs/finish',  only: :update
      resources :items, controller: 'outputs/items'
    end
    
    resources :entrances do
      resource :finish, controller: 'entrances/finish',  only: :update
      resources :items, controller: 'entrances/items'
    end
  end
  
  resources :cashiers do
    resource :close, controller: 'cashiers/close', only: :update
    get :daily_sale_report, :on => :member
  end
  
  namespace :cashiers do
    resources :entrances
    resources :outs
    resources :sales do
      resource :finish, controller: 'sales/finish', only: :update
      resources :items, controller: 'sales/items'
    end
  end
  
  namespace :reports do
    resources :comissions,    only: :index
    resources :sales,         only: :index
    resources :stocks,        only: :index
    resources :stores_sales,  only: :index
    resources :clients,       only: :index
  end

  namespace :autocompletes do
    resources :search_postal_codes, only: :index
    resources :search_cities, only: :index
    resources :suppliers, only: :index
    resources :feedstocks, only: :index
    resources :vendors, only: :index
    resources :clients, only: :index
    resources :products, only: :index
    resources :stock_industries, only: :index
    resources :stock_stores, only: :index
    resources :addresses, only: :index
  end
  
  resources :clients

  resources :orders do
    resource :attendance, controller: 'orders/attendance',  only: :update
    resource :attending,  controller: 'orders/attending',   only: :update
    resource :ready,      controller: 'orders/ready',       only: :update
    resource :deliver,    controller: 'orders/deliver',     only: :update
    resource :cancel,     controller: 'orders/cancel',      only: :update
    
    get :print, :on => :member
    get :print_done, :on => :member
    get :attendances, :on => :collection
    get :list_delivers, :on => :collection
    
    resources :exchange_items, controller: 'orders/exchange_items', only: [:create, :destroy]

    resources :items, controller: 'orders/items' do
      get :attendances, :on => :collection
    end
  end
  
  resources :center_costs
  resources :suppliers
  resources :clients
  resources :addresses
  resources :search_suggestions
  resources :feedstocks
  resources :bills

  namespace :products do
    resources :groups
  end
  
  resources :products do
    get :print_industry_price, :on => :collection
    get :find_by_barcode, :on => :collection
  end

  resources :stocks do
    collection do
      get :store_list
      get :change
      get :level
    end
  end
  
  root :to => 'home#index'
  devise_for :users
end
