Rails.application.routes.draw do





  root 'search#index'
  get 'search/update_airline',  as: 'update_airline'
  get 'search/update_seat', as: 'update_seat'
  get 'search/update_aircraft', as: 'update_aircraft'
  get 'search/update_routes', as: 'update_routes'
  post 'search/result'


  scope '/admin' do
    get '/login' => 'session#new', as: 'login_path'
    post '/login' => 'session#create'
    get '/logout' => 'session#destroy'
    get '/dashboard' => 'dashboard#index', as: 'dashboard_path'

    #For aircraft
    "#{
    get '/aircraft/index', as: 'aircraft_index'
    get '/aircraft/edit', as: 'aircraft_edit'

    post '/aircraft/update', as: 'aircraft_update'
    post '/aircraft/create', as: 'aircraft_create'
    get '/aircraft/new', as: 'aircraft_new'
    delete '/aircraft/destroy', as: 'aircraft_destroy'
    }"

    #For airline
    "#{
    get '/airline/index', as: 'airline_index'
    get '/airline/edit', as: 'airline_edit'

    post '/airline/update', as: 'airline_update'
    post '/airline/create', as: 'airline_create'
    get '/airline/new', as: 'airline_new'
    delete '/airline/destroy', as: 'airline_destroy'
    }"


    #For alliance
    "#{
    get '/alliance/index', as: 'alliance_index'
    get '/alliance/edit', as: 'alliance_edit'

    post '/alliance/update', as: 'alliance_update'
    post '/alliance/create', as: 'alliance_create'
    get '/alliance/new', as: 'alliance_new'
    delete '/alliance/destroy', as: 'alliance_destroy'
    }"
    #For mile
    "#{
    get '/mile/index', as: 'mile_index'
    get '/mile/edit', as: 'mile_edit'

    post '/mile/update', as: 'mile_update'
    post '/mile/create', as: 'mile_create'
    get '/mile/new', as: 'mile_new'
    delete '/mile/destroy', as: 'mile_destroy'
    }"

    #For route
    "#{
    get '/route/index', as: 'route_index'
    get '/route/edit', as: 'route_edit'

    post '/route/update', as: 'route_update'
    post '/route/create', as: 'route_create'
    get '/route/new', as: 'route_new'
    delete '/route/destroy', as: 'route_destroy'
    }"

    #For admin
    "#{
    get '/create' => 'admins#new', as: 'admin_create'
    get '/all' => 'admins#index', as: 'admin_all'
    post '/create' => 'admins#create',as: 'admin_create_now'
    }"


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
