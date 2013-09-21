MariasBilder::Application.routes.draw do
  
  namespace :admin do
    get '', to: 'admin#index'
    resources :images, except: :show
    resources :categories, except: :show
    resources :sub_categories, except: :show
    post 'categories/order', to: 'categories#order'
    post 'sub_categories/order', to: 'sub_categories#order'
    post 'images/order', to: 'images#order'
  end
  
  root to: 'show#latest', as: :show_latest
  get '/vita', to: 'meta#vita', as: :vita
  get '/contact', to: 'meta#contact', as: :contact
  get '/imprint', to: 'meta#imprint', as: :imprint
  get '/:category/:seo_category', to: 'show#category', as: :show_category
  get '/:category/:seo_category/:sub_category/:seo_sub_category', to: 'show#sub_category'
  get '/:category/:seo_category/:sub_category/:seo_sub_category/:image/:seo_image', to: 'show#image', as: :show_image
  
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
