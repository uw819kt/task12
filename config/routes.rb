Rails.application.routes.draw do
  root 'sessions#new'
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit]
end

#onlyで特定のアクションのルーティングのみ作成
