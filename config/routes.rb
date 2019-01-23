Rails.application.routes.draw do

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

  # Priority is based on order of creation: first -> highest priority
end
