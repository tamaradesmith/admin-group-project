Rails.application.routes.draw do
  resources :users, only:[:new, :create]
  resources :sessions, only:[:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :assignments
  post '/courses/:course_id/assignments/:assignment_id/course_assignments', {to: "course_assignments#create"}
  patch '/courses/:course_id/assignments/:assignment_id/course_assignments/:id', {to: "course_assignments#update"}
  delete 'course_assignments/:id', {to: "course_assignments#destroy"}
  get '/courses/:course_id/course_assignments', {to: "course_assignments#index", as: :course_assignments}

  resources :courses
  root 'welcome#home'
  resources :attendance, only: [:index, :show, :edit, :update]
  resources :users do
    collection { post :import }
  end
end
