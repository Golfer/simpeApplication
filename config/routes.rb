Rails.application.routes.draw do
  root 'landing#index'
  resources :messages do
    member do
      match :reply, via: %i(get patch)
    end
  end

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
end
