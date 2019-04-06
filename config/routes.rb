Rails.application.routes.draw do
  root 'tests#index'

  # get 'sessions/new'
  # get 'users/new'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    # POST tests/:id/start
    member do
      post :start
    end
  end

  # GET test_passages/:id/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
