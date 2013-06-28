Keroauc::Application.routes.draw do
  constraints(AuthConstraint.new) do
    resources :tasks
    root to: 'home#index'
  end

  root to: redirect('/auth/google_oauth2'), as: 'unauthenticated_root'
  post '/auth/:provider/callback' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'
end
