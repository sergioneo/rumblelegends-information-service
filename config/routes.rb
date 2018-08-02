Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/manager', as: 'rails_admin'
  get 'query', to: 'query#get'

  get 'beast/post'

  get 'beast/:id', to: 'beast#get'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
