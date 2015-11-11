Rails.application.routes.draw do

  get 'user_sessions/login' => "user_sessions#new", :as=>:login

  get 'user_sessions/logout' => "user_sessions#destroy", :as=>:logout
  resources :users
  resources :votes
  resources :links do
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  resources :user_sessions


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'links#index'

   post 'links/use' => 'votes#use_link', :as => :use_link

   post 'links/vote' => 'links#vote', :as => :link_vote

   post 'subcategories/vote' => 'subcategories#vote', :as => :subcategory_vote

   get 'existing/link' => 'votes#existing_link_vote', :as =>:existing_link_vote

   get '/subcategories' => 'subcategories#index', :as => :subcategories

   get '/subcategories/new' => 'subcategories#new', :as => :new_subcategory

   post '/subcategories' => 'subcategories#create'

   get '/:name' => 'subcategories#show', :as => :subcategory

   get '/:name/edit' => 'subcategories#edit', :as => :edit_subcategory

   patch '/:name' => 'subcategories#update'

   delete '/subcategories/:name' => 'subcategories#destroy'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
