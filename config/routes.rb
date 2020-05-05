Rails.application.routes.draw do
  root to: 'articles#index'

  # ユーザー
  resource :user
  get '/user/articles',  to: 'articles#user_articles'
  get '/user/problems',  to: 'problems#user_problems'

  # ログイン　ログアウト
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

  # 記事 記事関連の問題
  resources :articles do
    resources :problems
  end
  get '/problems', to: 'problems#all_problem'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
