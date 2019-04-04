Rails.application.routes.draw do
  get 'users/new'
  root 'tests#index'

  get :signup, to: 'user#new'

  resources :users, only: :create

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
