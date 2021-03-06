Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :pies do
    resources :ingredients
  end

  namespace :cakes do
    resources :ingredients, only: [:index]
  end

  resources :bakers do
    resources :recipes
  end

end
