Rails.application.routes.draw do
    devise_for :users, controllers: {
    registrations: 'users/registrations', #←これを追加しないとwiewを変更できない。
    sessions: "users/sessions",
  }

  resources :users #ルーティングをしてくれる
  resources :books

  root "home#top"
  get "home/about", to: "home#about"

 
end
#ダブルクオート→全てそれでいい

#命名規則
# モデル名	単数形、先頭は英大文字	List
# モデルのファイル名	単数形、先頭は英小文字	list.rb
# テーブル名	複数形、先頭は英小文字	lists
# コントローラー名→複数形	

# devise名前でログイン
# config/initializers/devise.rb
# config.authentication_keys = [:email] ←nameに変更