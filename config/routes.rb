Rails.application.routes.draw do
  resources :users, only:[:new, :create]
  resources :sessions, only:[:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Path for Courses
  resources :courses
  
  # Path for Enrollments
  post '/courses/:course_id/users/:user_id/enrollments', {to: "enrollments#create"}
  patch '/courses/:course_id/users/:user_id/enrollments/:id', {to: "enrollments#update"}
  delete 'enrollments/:id', {to: "enrollments#destroy"}
  get '/courses/:course_id/enrollments', {to: "enrollments#index", as: :enrollments}
  
   root 'welcome#home'
  resources :attendance, only: [:index, :show, :edit, :update]
  resources :users do
    collection { post :import }
  end
end
