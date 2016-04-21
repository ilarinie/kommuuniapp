Rails.application.routes.draw do
  resources :chores
  resources :purchases
  resources :purchase_categories, only: [:show, :new, :create]
  resources :todo_solutions, only: [:create, :destroy]
  resources :users
  resources :xps, only: [:index]
  resources :todos, only: [:new, :show, :index, :create, :update, :destroy]
  resources :todo_categories, only: [:new,:edit,:create,:update]
  resources :refunds, only: [:new,:index,:create]
  resource :session, only: [:new, :create, :destroy]

  get 'index', to: 'index#index'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'

  # adds chore to the users list
  post 'addchore', to: 'chore_users#add_to_user'

  # removes chore from the users list
  delete 'removechore', to: 'chore_users#remove_from_user'

  # makes a private chore public
  post 'publishchore', to: 'chores#publish'

  # creates a new task for the chore
  post 'completechore', to: 'chores#complete'

  # refunds
  post 'confirmrefund', to: 'refunds#confirm'
  post 'cancelrefund', to: 'refunds#cancel'

  #user reactivation
  post 'activateuser/:id', to: 'users#activate'
  get 'manage/users', to: 'users#manage'


  root 'index#index'

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
