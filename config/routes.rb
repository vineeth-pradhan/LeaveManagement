LeaveManagement::Application.routes.draw do
#  
##  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
#  match "/logout" => "sessions#destroy"
#  
##  map.login '/login', :controller => 'sessions', :action => 'new'
#   match "/login" => "sessions#new"
#  
##  map.register '/register', :controller => 'employees', :action => 'create'
#   match "/register" => "employees#create"
#   
##  map.signup '/signup', :controller => 'employees', :action => 'new'
#   match "/signup" => "employees#new", :as => :signup
#
#  resources :employees do
#    resources :applied_offs do
#      collection do
#        post 'update_status'
#      end
#    end
#    resources :available_offs
#  end
#  
##  resources :images
#  resources :designations
#  resources :leave_policies
#  resource  :session
##  map.home '/',:controller => 'site', :action => 'site'
#  root :to => "site#site"
#  match "/site/site" => "site#site"
#  
#  # The priority is based upon order of creation:
#  # first created -> highest priority.
#
#  # Sample of regular route:
#  #   match 'products/:id' => 'catalog#view'
#  # Keep in mind you can assign values other than :controller and :action
#
#  # Sample of named route:
#  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
#  # This route can be invoked with purchase_url(:id => product.id)
#
#  # Sample resource route (maps HTTP verbs to controller actions automatically):
#  #   resources :products
#
#  # Sample resource route with options:
#  #   resources :products do
#  #     member do
#  #       get 'short'
#  #       post 'toggle'
#  #     end
#  #
#  #     collection do
#  #       get 'sold'
#  #     end
#  #   end
#
#  # Sample resource route with sub-resources:
#  #   resources :products do
#  #     resources :comments, :sales
#  #     resource :seller
#  #   end
#
#  # Sample resource route with more complex sub-resources
#  #   resources :products do
#  #     resources :comments
#  #     resources :sales do
#  #       get 'recent', :on => :collection
#  #     end
#  #   end
#
#  # Sample resource route within a namespace:
#  #   namespace :admin do
#  #     # Directs /admin/products/* to Admin::ProductsController
#  #     # (app/controllers/admin/products_controller.rb)
#  #     resources :products
#  #   end
#
#  # You can have the root of your site routed with "root"
#  # just remember to delete public/index.html.
#  # root :to => "welcome#index"
#
#  # See how all your routes lay out with "rake routes"
#
#  # This is a legacy wild controller route that's not recommended for RESTful applications.
#  # Note: This route will make all actions in every controller accessible via GET requests. 
   resource  :session, :only => ['new', 'create', 'destroy']
   resources :designations
   resources :leave_policies
   resources :employees do
     member do
       get 'doc_report'
     end
     resources :applied_offs
     resources :available_offs
   end
   root :to => "site#site"
   match ':controller(/:action(/:id(.:format)))'
end
