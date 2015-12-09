Rails.application.routes.draw do
  get 'roles/index'

  get 'roles/create'

  get 'roles/update'

  get 'roles/destroy'

  get 'roles/show'

  get 'role/index'

  get 'role/create'

  get 'role/update'

  get 'role/destroy'

  get 'role/show'
  get '/newletter' => 'users#newsletter'
  post '/newletter' => 'users#ma_send'

  resources :posts
  resources :users
  get 'users/create'

  get '/' => 'posts#index'

  get 'users/login'

  get '/fr' => "users#set_fr"

  get '/en' => "users#set_en"

  get 'users/logout'

 # get 'posts/index', :as => 'user'

  get 'posts/top'

  get 'posts/random'

  resources :roles
  get 'posts/single'
  get '/logout' => 'sessions#destroy'
  get '/sign_up' => 'users#form_login'
  post '/sign_up' => 'users#login'
  get 'posts/index'

  resources :sessions

# FORUM
  get '/forum' => 'forum#index'

  get '/forum/:id' => 'forum#subcategory'

  get '/forum/:id/:id_sub' => 'forum#lstSub'

  get '/forum/:id/:id_sub/newtopic' => 'forum#newtopic'

  post '/forum/:id/:id_sub/post' => 'forum#savetopic', :as => 'new_topic_path'
  get '/topic/:id' => 'topic#index', :as => 'topic_path'

 #  get '/users' => 'users#index'

  get '/topic/:id/new' => 'topic#new', :as => 'new_message'
  post '/topic/:id/new' => 'topic#create'

  get '/topic/:id/:id_reply/new' => 'topic#new_reply', :as => 'new_reply_path'
  post '/topic/:id/:id_reply/new' => 'topic#create_reply'

  # TICKET 
  get '/ticket' => 'ticket#index'
  get '/ticket/new' => 'ticket#new', :as => 'new_ticket'
  post '/ticket/new' => 'ticket#create'

  get '/ticket/spool' => 'ticket#spool'
  get '/ticket/:id/edit' => 'ticket#edit'
  patch '/ticket/:id' => 'ticket#update', :as => 'edit_ticket'

  get '/ticket/:id/reply' => 'ticket#reply', :as => 'message_tickets'
  post '/ticket/:id/reply' => 'ticket#createReply'

  get '/ticket/:id/show' => 'ticket#show'

  get '/ticket/open' => 'ticket#open'
  get '/ticket/close' => 'ticket#close'

  get '/:id/edit' => 'forum#edit'
  post '/:id/edit' => 'forum#update'
  patch '/:id/edit' => 'forum#update', :as => 'category'

  delete '/:id/edit' => 'forum#destroy'
  get '/new' => 'forum#new'
  post '/new' => 'forum#create', :as => 'categories'

  get '/subcategory/:id/new' => 'forum#newsub'
  post '/subcategory/:id/new' => 'forum#createsub', :as => 'sub_categories'

  get '/subcategory/:id_sub/edit' => 'forum#editsub'
  post '/subcategory/:id_sub/edit' => 'forum#updatesub'
  patch '/subcategory/:id_sub/edit' => 'forum#updatesub', :as => 'sub_category'
  delete '/subcategory/:id_sub/edit' => 'forum#destroysub'
  resources :ticket
  resources :reply_message
  resources :message

 # post '/users' => 'users#create'
  resources :articles do
    resources :comments
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'

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
