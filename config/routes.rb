Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'public#index'

  resources :users do
    resources :reviews
  end
  
  get '/profile' => 'private#profile'
  get '*path' => 'public#not_found'
end
