Rails.application.routes.draw do
  resources :user_courses
  resources :meetings
  resources :courses
  resources :users
  post '/login', to: 'auth#create'
end
