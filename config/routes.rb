Rails.application.routes.draw do
  resources :user_courses
  resources :meetings
  resources :courses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# Rails.application.routes.draw do
#   namespace :api do
#     namespace :v1 do
#       resources :user_courses
#       resources :meetings
#       resources :courses
#       resources :users
#     end
#   end
# end