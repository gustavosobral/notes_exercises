# It is even possible to extract this concern into a separate file
concern :sociable do |options|
  resources :comments, options
  resources :categories, options
  resources :tags, options
end

resources :messages, concerns: :sociable
resources :items do
  concerns :sociable, only: :create
end
