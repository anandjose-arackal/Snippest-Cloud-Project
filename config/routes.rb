Rails.application.routes.draw do

  get 'admin/index'

  root 'welcome#index'

  get 'users/login'

  get 'users/new'

  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact' => 'welcome#contact'

  get 'posts/post_about' =>'posts#post_about'

  get 'search', to: 'search#search'


  #get 'posts/:id' => 'posts#show' , as: :post

  get 'userdets/show' => 'userdets#show'

  get 'users/logout'

  post 'posts' => 'posts#create'

  post 'users' => 'users#create'

  post 'users/attempt_login' => 'users#attempt_login'

  post 'posts/search' => 'posts#search'

  match 'like', to: 'likes#like', via: :post

  match 'unlike', to: 'likes#unlike', via: :delete

  #match ':controller(/:action(/:id))', :via => [:get,:post]
  resources :users do
    resources :userdets
  end
  resources :posts do
   resources :comments
   resources :attachments
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
