Rails.application.routes.draw do


devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}


namespace :admin do
     root 'homes#top'
     resources :items
     resources :members
     resources :orders, only: [:index, :show]
  end

namespace :public do
     root 'homes#top'
     resources :items
     resources :cart_items
     patch 'cart_items' => 'cart_items#update'
     # 注文完了画面へ遷移
     get 'orders/complete' => 'orders#complete'
     resources :orders, only: [:new, :index, :show, :create]
     get 'customers/quit' => 'customers#quit'
     # 退会処理
     patch 'customers/withdraw' => 'customers#withdraw'
     resources :customers, only: [:show, :edit, :update]
     # 注文情報入力画面から注文情報確認画面への遷移（postがあるから不要？）
     # get 'orders/comfirm' => 'orders#comfirm'
     # 注文情報入力画面から注文情報確認画面
     post 'orders/comfirm' => 'orders#comfirm'
     # 注文情報確認画面からcreateアクション（既にある？）
     # post 'orders' => 'orders#create'
     post 'items_path' => 'items#create'
     get 'about' => 'homes#about'
  end





# root 'public/items#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
