Rails.application.routes.draw do
  get 'events/index'

  get 'events/show'

  get 'events/create'

  get 'events/update'

  get 'events/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
