Rails.application.routes.draw do
  resources :users, only:[:new, :create]
  resources :sessions, only:[:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :courses
   root 'welcome#home'
  resources :attendance, only: [:index, :show, :edit, :update]
  
end
