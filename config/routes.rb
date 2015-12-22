Rails.application.routes.draw do
  resources :mains

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'mains#index'
  # resources :companies



  resources :articles do
      member do
        get 'short' => 'articles#tak'
        post 'long'
      end
      collection do
        get 'col'
        post 'row'
      end
  end
  get '/custom' => 'articles#custom'

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
  concern :onsale do
    resources :sales
    get 'special'
  end
  resources :products do
    # resources :sales
    # get '/sales' => 'products#sales'
    # resources :sales do
    #   get 'recent', on: :collection
    # end
    concerns :onsale
  end

  get 'products/sales' => 'sales#all', as: 'all_sales'

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
