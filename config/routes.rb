Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help', as: 'help'
  #「get」とあるので、GETリクエストを受け取った際のアクションを結び付けている
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create' #restfulルーティングの名前を変更！
  #リソースを扱うページでないので、上記は、リソースベースのルーティングをしていない

  resources :users #左で、railsのrest機能がusersリソースに対して有効となる

end

