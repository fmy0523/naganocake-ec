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
  end

namespace :public do
     root 'homes#top'
     resources :items
     resources :cart_items
     resources :orders, only: [:new, :create]
     resources :customers
     # 注文情報入力画面から注文情報確認画面への遷移
     get 'orders/comfirm' => 'orders#comfirm'
     # 注文完了画面へ遷移
     get 'orders/complete' => 'orders#complete'
     # 注文情報入力画面のpost
     post 'orders/comfirm' => 'orders#create'
     post 'items_path' => 'items#create'
     get 'about' => 'homes#about'
  end





# root 'public/items#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
