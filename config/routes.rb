Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/blogs', to: 'blogs#create'
  get '/blogs', to: 'blogs#index'

  get '/blogs/:id', to: 'blogs#show'

  patch '/blogs/:id', to: 'blogs#update'

  delete '/blogs/:id', to: 'blogs#destroy'

end
