Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :houses, only: %i[index show]
  resources :cities, only: %i[index show]
end
