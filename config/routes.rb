Techosh::Application.routes.draw do

  get "errors/file_not_found"

  get "errors/unprocessable"

  get "errors/internal_server_error"

  get "blog/index"

  get "blog/show"

  devise_for :users, path_names: { sign_in: 'admin' }
  devise_scope :user do
     get "admin", to: "devise/sessions#new"
  end

  root :to => 'static_pages#home'

  get "/about" => "static_pages#about"

  get "/terms" => "static_pages#term"

  get "/policy" => "static_pages#policy"
  
  get "/contact" => "static_pages#contact"

  get "/category/:category_id" => "categories#show", as: :categorywisetuts
  get "/university/:university_id" => "universities#show", as: :universitywisetuts
  get "/subject/:subject_id" => "subjects#show", as: :subjectwisetuts


  get "/404", to: "errors#file_not_found"
  get "/422", to: "errors#unprocessable"
  #get "/500", to: "errors#internal_server_error"
  
  resources :lectures do
     
     resources :videotuts, :path => "video-tutorials"
  end
 
  namespace :admin do
    resources :articles
    resources :tags
    resources :tutorials do 
    resources :videos
    resources :subjects
    resources :categories
    resources :universities
  end
   
  end

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
 

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
