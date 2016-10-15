Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  get 'events/index'

  get 'events/show'

  get 'events/create'

  get 'events/update'

  get 'events/destroy'
end
