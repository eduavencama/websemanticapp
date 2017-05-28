Rails.application.routes.draw do
  get 'property/index'

  get 'class/index'

  get 'instance/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'welcome#index'
get '/artist/index'
#get "/persona", to: "person#index"

#resources :artists
#root 'artist#index'

end
