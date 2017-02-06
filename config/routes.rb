Rails.application.routes.draw do
  resources :advertisements

  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/new'

  # get 'posts/edit'
     
  resources :posts

  get "about"=>'welcome/about'
  
  root 'welcome#index'

end
