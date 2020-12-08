Rails.application.routes.draw do
  resources :scores 

  resources :judges do
    resources :players, only: [:index], controller: 'judge_players' do
      resources :scores, only: [:edit, :show, :delete]
    end
  end

  resources :players

  get 'results', to: 'players#results'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
