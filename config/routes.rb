Strongape::Application.routes.draw do
  devise_for :users

  match "workout_logs/showall" => "workout_logs#showall", :as => :showall_workout_log
  match "workout_logs/showcharts" => "workout_logs#showcharts", :as => :showcharts_workout_log
  match "workout_logs/showallnotes" => "workout_logs#showallnotes", :as => :showallnotes_workout_log
  match "workout_logs/showallprint" => "workout_logs#showallprint", :as => :showallprint_workout_log
  match "workout_logs/importlifts" => "workout_logs#importlifts", :as => :importlifts_workout_log

  post "from_file" => 'workout_logs#from_file'
  post "from_text" => 'workout_logs#from_text'

  resources :workout_logs

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
  root :to => 'WorkoutLogs#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
