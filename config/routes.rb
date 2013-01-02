SyndicateManager::Application.routes.draw do

  resources :winning_numbers

  resources :lottery_selections

  resources :payments

  resources :users
  match "/users/:id/approve_man"  => "users#approve_man"  , :as => :approve_man
  match "/users/:id/reject_man"  => "users#reject_man"  , :as => :reject_man


  resources :syndicates
  match "/syndicates/:id/approve"  => "syndicates#approve"  , :as => :approve
  match "/syndicates/:id/reject"  => "syndicates#reject"  , :as => :reject

  resources :main

  resources :sessions, only: [:new, :create, :destroy]

  get 'admin' => 'users#adminhome'

  #match '/session', to: 'users#adminhome'
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


  #match '/syndicates/:id/approval' => 'syndicates#approval'

  #match '/syndicates_users' =>

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  #match 'syndicates/:id/approve' => 'syndicates#approve', :as => :approve

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
  #root :to => 'main#index'
  root :to => 'sessions#new'
  # map.root :controller => 'Welcomes', :action => :index
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  #map.root :controller => 'main', :action => :index
end
