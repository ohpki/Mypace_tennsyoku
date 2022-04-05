Rails.application.routes.draw do
  devise_for :nurses, skip: [:passwords], controllers: {
    registrations: "worker/registrations",
    sessions: 'worker/sessions'
}
  devise_for :hospitals, skip: [:passwords], controllers: {
    registrations: "employer/registrations",
    sessions: "employer/sessions"
}
  devise_scope :nueses do
    post 'worker/guest_sign_in', to: 'worker/sessions#guest_sign_in'
  end

  root to: 'homes#top'
  get 'homes/top'
  get 'homes/about'
  get 'homes/nurse'
  get 'homes/hospital'
  get 'homes/confirm'
  resources :notifications, only: [:new, :create, :index, :edit]
  resources :chat_rooms, only: [:new, :create, :index, :show] do
    resources :chats, only: [:new, :create, :index]
  end
  namespace :employer do
    resources :nurses, only: [:show, :index] do
      resources :scouts, only: [:new, :index, :create, :destroy]
    end
    resource :hospitals, only: [:show, :index, :edit, :update, :destroy]
    get 'hospitals/quit'

    resources :job_informations, only: [:new, :create, :show, :index, :edit, :update, :destroy]
    get 'subscriptions/index'
  end

  namespace :worker do
    resources :subscriptions, only: [:new, :create, :show, :index, :edit, :update, :destroy]
    resources :hospitals, only: [:show]
    resource :nurses, only: [:show, :edit, :update, :destroy]
    get 'nurses/quit'
    resources :job_informations, only: [:index, :show] do
      resources :favorites, only: [:new, :create, :index, :destroy]
    end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
