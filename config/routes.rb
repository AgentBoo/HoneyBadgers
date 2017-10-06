Rails.application.routes.draw do
  resources :badges do
    collection do
      get 'all'
      post 'add'
    end
  end

  resources :orders do
    collection do
      get 'complete'
    end
  end

  resources :charges
  
    root to: "badges#all"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
