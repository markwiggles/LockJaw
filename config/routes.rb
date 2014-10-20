Rails.application.routes.draw do


  root 'home#index'

  get 'admin', :to => 'admin_homes#index'


  resources :admin_homes, :admin_buymsgs, :admin_buyposters, :admin_social_medias, :admin_tabs, :admin_sections, :admin_testimonials,
            :admin_faqs, :admin_abouts, :admin_hows, :admin_contacts, :admin_emails, :blogs


  get 'controller/:id/action/:param' => 'controller#action', :as => 'custom_show'

  resources :admin_sections do
    member do
      get 'edit_image'
      post 'change_image'
      patch 'change_image'
    end
  end

  resources :admin_abouts do
    member do
      get 'edit_image'
      post 'change_image'
      patch 'change_image'
    end
  end

  resources :admin_contacts do
    member do
      get 'edit_image'
      post 'change_image'
      patch 'change_image'
    end
  end

  resources :admin_emails do
    member do
      get 'edit_image'
      post 'change_image'
      patch 'change_image'
    end
  end


  resources :admin_hows do
    member do
      get 'edit_image'
      post 'change_image'
      patch 'change_image'
    end
  end

  resources :admin_homes do
    member do
      get 'edit_image'
      post 'change_image'
      patch 'change_image'
    end
  end

  resources :admin_social_medias do
    member do
      get 'edit_image'
      post 'change_image'
      patch 'change_image'
    end
  end

  resources :admin_buyposters do
    member do
      get 'edit_image'
      post 'change_image'
      patch 'change_image'
    end
  end

  resources :contact do
    member do
      post 'create_message'
    end
  end


  match 'admin_tabs/destroy', :via => [:get, :post]

  match ':controller(/:action(/:id))', :via => [:get, :post, :patch]

  get 'home', :to => 'home#index'
  get 'brochure', :to => 'home#brochure'
  get 'how-it-works', :to => 'how#index'
  get 'download', :to => 'download#index'
  get 'testimonials', :to => 'testimonials#index'
  get 'faq', :to => 'faq#index'
  get 'about-us', :to => 'about_us#index'
  get 'contact-us', :to => 'contact#index'
  get 'blog', :to => 'blogs#index'

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/shop'

  Spree::Core::Engine.routes.draw do

    root :to => 'products#show', :as => :buy, :id => 1
    #
    # get 'buy', :to => 'products#show', :as => :buy, id: 1

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
