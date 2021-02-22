Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registration => "users/registrations",
    :session => "users/sessions"
  }

  resources :products
  root 'products#index'

  get 'api/news'
  get 'api/:date1/:date2', to: 'api#between_dates'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
