Keroauc::Application.routes.draw do
  constraints(AuthConstraint.new) do
    resources :tasks
    resources :recurrences, except: [:index]
    root to: 'home#index'
  end

  constraints(ApiConstraint.new) do
    resources :recurrences, only: [:index]
  end

  root to: redirect('/auth/google_oauth2'), as: 'unauthenticated_root'
  post '/auth/:provider/callback' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'
end
