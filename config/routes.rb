Rails.application.routes.draw do
  resources :users, only:[:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :courses
   root 'welcome#home'
  resources :attendance, only: [:index, :show, :edit, :update]
  resources :users do
    collection { post :import }
  end

  #This should work for editing password, but I'm not entirely sure
  #Going to test this out
  resources :users
  get '/users/:id/edit_password', {to: 'users#edit_password', as: :edit_user_password}
end
