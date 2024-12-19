Rails.application.routes.draw do
  root 'sessions#new'
  resources :tasks
  resources :sessions
  resources :users
end

#onlyで特定のアクションのルーティングのみ作成
