Rails.application.routes.draw do
  resources :users, only:[:new, :create, :edit, :destroy]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :assignments
  
  # course_assignments
  post '/courses/:course_id/assignments/:assignment_id/course_assignments', {to: "course_assignments#create"}
  patch '/courses/:course_id/assignments/:assignment_id/course_assignments/:id', {to: "course_assignments#update"}
  delete 'course_assignments/:id', {to: "course_assignments#destroy"}
  get '/courses/:course_id/course_assignments', {to: "course_assignments#index", as: :course_assignments}

  # marks
  get '/courses/:course_id/users/:user_id/marks', {to: "marks#show_assignments"}
  post '/course_assignments/:course_assignments_id/users/:user_id/marks', {to: "marks#create"}
  patch '/course_assignments/:course_assignments_id/users/:user_id/marks/:id', {to: "marks#update"}
  delete '/marks/:id', {to: "marks#destroy"}
  get '/course_assignments/:course_assignments_id/users/:user_id', {to: "marks#index", as: :marks}

  resources :courses
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
