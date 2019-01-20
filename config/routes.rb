Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'
  resources :messages do
    member do
      match :reply, via: %i(get patch)
    end
  end
end
