Rails.application.routes.draw do
  
  # get '/top' => 'homes#top'
# root :to => 'books#top'  
root :to => 'homes#top'
  # get '/' => 'homes#top'
  get '/' => 'books#index'
  
  resources :books
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
