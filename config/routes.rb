TrainingRails4::Application.routes.draw do


  devise_for :users
  get "home/index"
  get "home/contact"
  
  resources :massages

  resources :users

  resources :posts do
    member do  # << xxx_post_path(model)  , model is pass in record...
      get "info"
    end
    collection do   # << no need pass in any record , xxx_posts_path
      get "contact"
      get :custom_form  # << same as "custom_form"
      post :process_custom_data   #<< receive record
    end
    resources :comments do 
      member do
        get "info"  #info_post_comment_path
      end
      collection do 
        get "contact"   #contact_post_comments_path
      end
    end
  end

  root "home#index"

  

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
