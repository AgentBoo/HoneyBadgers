Rails.application.routes.draw do
  resources :badges do
    collection do
      get 'all'
    end
  end
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
