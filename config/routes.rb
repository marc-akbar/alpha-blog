Rails.application.routes.draw do
  # Priority is based on order of creation: first -> highest priority

  # Changes root page to the home page
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles
  # Created:
    # A new article path
    # A post to create articles
    # An edit article path
    # A patch to update articles
    # Delete article path
    # Show article path
    # Index article path

  get 'signup', to: 'users#new'
  resource :users, except: [:new]

end
