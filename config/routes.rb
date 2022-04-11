Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}
  devise_for :nurses, skip: [:passwords], controllers: {
    registrations: 'worker/registrations',
    sessions: 'worker/sessions'
}
  devise_for :hospitals, skip: [:passwords], controllers: {
    registrations: 'employer/registrations',
    sessions: 'employer/sessions'
}

  root to: 'homes#top'
  get 'report/new_mail'
  get 'report/send_mail'
  get 'homes/top'
  get 'homes/about'
  get 'homes/nurse'
  get 'homes/hospital'
  get 'homes/confirm'
  resources :notifications, only: [:new, :create, :index, :edit]
  resources :chat_rooms, only: [:new, :create, :index, :show, :update] do
    resources :chats, only: [:new, :create, :index]
  end
  
  namespace :admin do
    resources :nurses, only: [:index, :show, :destroy] do
      get 'confirm'
    end
    resources :hospitals, only: [:index, :show, :destroy] do
      get 'confirm'
    end
    post '/guest_sign_in', to: 'guests#guest_sign_in'
    get 'search/nurse', to: 'nurses#search'
    get 'search/hospital', to: 'hospitals#search'
  end

  namespace :employer do
    get 'nurses/search', to: 'nurses#search'
    post '/guest_sign_in', to: 'guests#guest_sign_in'
    resources :nurses, only: [:show, :index] do
      resources :scouts, only: [:new, :index, :create, :destroy]
    end
    resource :hospitals, only: [:show, :index, :edit, :update, :destroy]
    get 'hospitals/quit'

    resources :job_informations, only: [:new, :create, :show, :index, :edit, :update, :destroy]
    get 'subscriptions/index'
  end

  namespace :worker do
    get "job_informations/search", to: "job_informations#search"
    post '/guest_sign_in', to: 'guests#guest_sign_in'
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
