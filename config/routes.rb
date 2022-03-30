Rails.application.routes.draw do
  devise_for :nurses, skip: [:passwords], controllers: {
    registrations: "worker/registrations",
    sessions: 'worker/sessions'
}
  devise_for :hospitals, skip: [:passwords], controllers: {
    registrations: "employer/registrations",
    sessions: "employer/sessions"

}
  root to: 'homes#top'
  get 'homes/top'
  get 'homes/about'
  get 'homes/nurse'
  get 'homes/hospital'
  get 'homes/confirm'
  resources :notifications, only: [:new, :create, :index, :edit]
  resources :chats, only: [:new, :create, :index]
  resources :chats, only: [:new, :create, :index, :show]

  namespace :employer do
    resources :nurses, only: [:show, :index]
    resource :hospitals, only: [:show, :index, :edit, :update, :destroy]
    get 'hospitals/quit'
    resources :scouts, only: [:new, :index, :create, :destroy]
    resources :job_informations, only: [:new, :create, :show, :index, :edit, :update, :destroy]
    get 'subscriptions/index'
  end

  namespace :worker do
    resources :subscriptions, only: [:new, :create, :show, :index, :edit, :update, :destroy]
    resources :hospitals, only: [:show]
    resource :nurses, only: [:show, :edit, :update, :destroy]
    resources :favorites, only: [:new, :create, :index, :destroy]
    resources :job_informations, only: [:index, :show]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
