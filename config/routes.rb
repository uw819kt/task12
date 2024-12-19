Rails.application.routes.draw do
  root 'sessions#new'
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end

#onlyで特定のアクションのルーティングのみ作成
