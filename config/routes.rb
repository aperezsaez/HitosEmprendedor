Rails.application.routes.draw do
  resources :products
  root 'products#index'

  get 'api/news'
  get 'api/:date1/:date2', to: 'api#between_dates'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
