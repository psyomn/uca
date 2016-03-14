Uca::Application.routes.draw do

  devise_for :users
  get 'users/edit/info/:id' => 'users#edit_info', as: :edit_user_info
  patch 'users/update/info/:id' => 'users#update_info', as: :update_user_info
  get 'users/:id' => 'users#show', as: :user
  post 'user/name/taken/:nickname' => 'users#check_username_taken', as: :check_username_taken

  resources :bands
  get 'bands/letter/:letter' => 'bands#letter', as: :band_letter

  resources :newsitems

  resources :ratings

  resources :songs

  resources :submissions

  scope 'admin' do
    get 'index', to: 'administration#index', as: :administration
  end

  namespace :submission_comments do
    post 'create'
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
  root :to => 'static_page#home'

  get 'home' => 'static_page#home'
  get 'about' => 'static_page#about'
  get 'login' => 'static_page#login'
  get 'register' => 'static_page#register'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
