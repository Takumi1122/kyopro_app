# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        articles#index
#                  new_user GET    /user/new(.:format)                                                                      users#new
#                 edit_user GET    /user/edit(.:format)                                                                     users#edit
#                      user GET    /user(.:format)                                                                          users#show
#                           PATCH  /user(.:format)                                                                          users#update
#                           PUT    /user(.:format)                                                                          users#update
#                           DELETE /user(.:format)                                                                          users#destroy
#                           POST   /user(.:format)                                                                          users#create
#             user_articles GET    /user/articles(.:format)                                                                 articles#user_articles
#             user_problems GET    /user/problems(.:format)                                                                 problems#user_problems
#                     login GET    /login(.:format)                                                                         sessions#new
#                           POST   /login(.:format)                                                                         sessions#login
#                    logout DELETE /logout(.:format)                                                                        sessions#logout
#          article_problems GET    /articles/:article_id/problems(.:format)                                                 problems#index
#                           POST   /articles/:article_id/problems(.:format)                                                 problems#create
#       new_article_problem GET    /articles/:article_id/problems/new(.:format)                                             problems#new
#      edit_article_problem GET    /articles/:article_id/problems/:id/edit(.:format)                                        problems#edit
#           article_problem GET    /articles/:article_id/problems/:id(.:format)                                             problems#show
#                           PATCH  /articles/:article_id/problems/:id(.:format)                                             problems#update
#                           PUT    /articles/:article_id/problems/:id(.:format)                                             problems#update
#                           DELETE /articles/:article_id/problems/:id(.:format)                                             problems#destroy
#                  articles GET    /articles(.:format)                                                                      articles#index
#                           POST   /articles(.:format)                                                                      articles#create
#               new_article GET    /articles/new(.:format)                                                                  articles#new
#              edit_article GET    /articles/:id/edit(.:format)                                                             articles#edit
#                   article GET    /articles/:id(.:format)                                                                  articles#show
#                           PATCH  /articles/:id(.:format)                                                                  articles#update
#                           PUT    /articles/:id(.:format)                                                                  articles#update
#                           DELETE /articles/:id(.:format)                                                                  articles#destroy
#                  problems GET    /problems(.:format)                                                                      problems#all_problem
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

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
