Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :new, :create, :show, :edit, :update] do
    collection do 
      get 'post','search','modal'
    end
  end

  resources :profiles, only: [:show, :new, :edit, :create, :update] do
    member do 
      get 'show_user'
    end
  end

end
