Rails.application.routes.draw do

   resources :topics do
    resources :posts, except: [:index]
   end
   
  resources :topics do
    resources :sponsored_posts, except: [:index]
  end
   
  resources :questions

  get "about"=>'welcome/about'
  
  root 'welcome#index'

end
