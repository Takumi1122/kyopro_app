Rails.application.routes.draw do
  root to: 'articles#index'

  # ユーザー
  resource :user

  # ログイン　ログアウト
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

  # 記事
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
