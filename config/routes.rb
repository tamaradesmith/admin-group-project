Rails.application.routes.draw do
  resources :users, only:[:new, :create, :edit, :destroy]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :assignments
  post '/courses/:course_id/assignments/:assignment_id/course_assignments', {to: "course_assignments#create"}
  patch '/courses/:course_id/assignments/:assignment_id/course_assignments/:id', {to: "course_assignments#update"}
  delete 'course_assignments/:id', {to: "course_assignments#destroy"}
  get '/courses/:course_id/course_assignments', {to: "course_assignments#index", as: :course_assignments}

  # Path for Courses
  resources :courses
  
  # Path for Enrollments
  post '/courses/:course_id/enrollments', {to: "enrollments#create"}
  patch '/courses/:course_id/users/:user_id/enrollments/:id', {to: "enrollments#update"}
  delete 'enrollments/:id', {to: "enrollments#destroy"}
  get '/courses/:course_id/enrollments', {to: "enrollments#index", as: :enrollments}
  
  root 'welcome#home'

  resources :attendance, only: [:index, :show, :edit, :update]
  resources :users do
    collection { post :import }
  end

  #This should work for editing password, but I'm not entirely sure
  #Going to test this out
  resources :user
  get '/users/:id/edit_password', {to: 'users#edit_password', as: :edit_user_password}
  patch '/users/:id', {to: 'users#update'}
  
  # For Program
  resources :programs
end
