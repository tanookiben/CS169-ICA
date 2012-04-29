ICA::Application.routes.draw do

  match '/auth/:provider/callback' => 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  match 'contacts' => 'contacts#search', :via => :get, :as => :search

  match 'about' => 'application#about', :via => :get, :as => :about

  match 'upload/page' => 'upload#page', :via => :get
  match 'upload/upload' => 'upload#upload', :via => :post

  # Needed for STI inheritance to be properly mapped by the form because
  # convention of form_for will look for the route of the specific model
  # rather than Person (i.e. looks for advisor_path instead of person_path)
  match 'individual/:id' => 'people#update', :via => :put, :as => :individual
  match 'board_member/:id' => 'people#update', :via => :put, :as => :board_member
  match 'advisor/:id' => 'people#update', :via => :put, :as => :advisor
  match 'education_company/:id' => 'companies#update', :via => :put, :as => :education_company
  match 'portfolio_company/:id' => 'companies#update', :via => :put, :as => :portfolio_company
  match 'professional_service_provider/:id' => 'companies#update', :via => :put, :as => :professional_service_provider
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :people
  resources :companies

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
   root :to => 'contacts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
