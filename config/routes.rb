MusicApp::Application.routes.draw do
  root to: 'bands#index'

  resources :bands, shallow: true do
    resources :albums, shallow: true do
      resources :tracks, shallow: true do
        resource :note
      end
    end
  end
end
