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
  end

  namespace :admin do
    root to: 'homes#top'
    resources:genres, only:[:index, :create, :edit, :update]
    resources:items, only:[:new, :index, :show, :edit, :create, :update]
    resources:customers, only:[:index, :show, :edit, :update]
    resources:orders, only:[:show, :update]
  end

end
