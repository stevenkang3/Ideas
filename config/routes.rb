Rails.application.routes.draw do
  root 'users#new'
# ======== USER =========
  get '/user/new' => 'users#new'
  get '/show/:id' => 'users#show'
  get '/user/:id' => 'users#edit'
  get '/users/:id' => 'users#index'
  post '/users' => 'users#create'
  patch '/users/:id' => "users#update"
  delete '/user/:id' => "users#destroy"

# ======== IDEAS =========
  get '/ideas' => 'ideas#index'
  get '/ideas/:id' => 'ideas#show'
  post '/ideas' => 'ideas#create'
  delete '/ideas/:id' =>'ideas#destroy'

# ========= SESSIONS =========
  get '/sessions/new' => 'sessions#index'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

# ========== LIKES =========
  post '/likes' => 'likes#create'
  delete '/likes' => 'likes#destroy'
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
