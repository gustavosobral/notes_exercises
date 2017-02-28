resources :zombies, only: :index

resources :zombies, only: [:index, :show]
resources :humans, except: [:destroy, :edit, :update]

with_options only: :index do |list_only|
  list_only.resources :zombies
  list_only.resources :humans
  list_only.resources :medical_kits
end

resources :zombies, constraints: { subdomain: 'api' }

constraints subdomain: 'api' do
  namespace :api, path: '/' do
    resources :zombies
    resources :humans
  end
end

namespace :api, path: '/', constraints:  { subdomain: 'api' } do
  resources :zombies
  resources :humans
end

### Initializer (initializers/inflections.rb)

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'API'
end
