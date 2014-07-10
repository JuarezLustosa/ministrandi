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
  
  resources :cashiers, only: [:create, :new]
  
  namespace :cashiers do
    resources :entrances
  end
  
  namespace :reports do
    resources :comissions, only: :index
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
    resources :addresses, only: :index
  end
  
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
  resources :products

  resources :stocks do
    collection do
      get :change
    end
  end
  
  root :to => 'home#index'

  devise_for :users
  # path :update_many

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
