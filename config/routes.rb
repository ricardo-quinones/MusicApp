MusicApp::Application.routes.draw do
  root to: 'sessions#new'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  post '/users/activate?token=:token' => 'users#activate'

  resources :bands, shallow: true do
    resources :albums, shallow: true do
      resources :tracks, shallow: true do
        resource :note
      end
    end
  end
end
