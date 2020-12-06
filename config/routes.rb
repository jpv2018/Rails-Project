Rails.application.routes.draw do
  resources :scores 

  resources :judges do
    resources :players, only: [:index], controller: 'judge_players'
    resources :scores, only: [:new]
  end

  resources :players


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
