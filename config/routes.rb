  Rails.application.routes.draw do
  devise_for :users
     root 'tweets#index'
     resources :tweets do
       resources :comments, only: [:create]
     end
      #tweets_controllerに対してのresourcesメソッド
     resources :users, only: [:show]
      #users_controllerに対してのresourcesメソッド
  end
     #以下はresourcesの中で規定済み
     # get'tweets'      => 'tweets#index'
     # get'tweets/new'  => 'tweets#new'
     # post'tweets'     => 'tweets#create'
     # delete 'tweets/:id' => 'tweets#destroy'
     # patch 'tweets/:id'  => 'tweets#update'
     # get 'tweets/:id/edit' => 'tweets#edit'
     # get 'users/:id'  => 'users#show'
     #    #Mypageへのルーティング
     # get 'tweets/:id' => 'tweets#show'
     #    ツイート詳細画面