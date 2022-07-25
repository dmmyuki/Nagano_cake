Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources:addresses, only: [:index, :edit, :create, :update, :destroy]
    resources:items, only:[:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources:cart_items, only:[:index, :create, :update, :destroy]
    resources:orders, only:[:index, :new, :show, :create] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
    resource:customers, only:[:edit, :update] do
      get 'mypage' => 'customers#mypage'
      get 'mypage/edit' => 'customers#edit'
      patch 'mypage/update' => 'customers#update'
      get 'unsubscribe' => 'customers#unsubscribe'
      patch 'withdrawal' => 'customers#withdrawal'
    end
  end

  namespace :admin do
    root to: 'orders#index'
    resources:genres, only:[:index, :create, :edit, :update]
    resources:items, only:[:new, :index, :show, :edit, :create, :update]
    resources:customers, only:[:index, :show, :edit, :update]
    resources:orders, only:[:index, :show, :update]
  end

end
