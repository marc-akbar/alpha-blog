Rails.application.routes.draw do

  # Changes root page to the home page
  root 'pages#home'
  get 'about', to: 'pages#about'

end
