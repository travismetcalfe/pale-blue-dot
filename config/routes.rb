Rails.application.routes.draw do |map|
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'stars#index'

  resources :stars, only: [:index, :show, :nearest] do
    collection do
      get 'nearest/:id', action: 'nearest', as: :nearest
    end
  end
  
end
