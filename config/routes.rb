Rails.application.routes.draw do
  root to: 'playlists#index'

  resources :playlists

  #Login
  get '/auth/spotify/', to: 'users#spotify_auth'
  get '/auth/spotify/callback', to: 'users#spotify'
  #c
  get 'playlists/:id/artists/:name', to:'artists#show', as: 'artist'
  post '/tracks', to: 'tracks#create', as: 'new_tracks'
  post '/playlists/:playlist_id/addTrack', to: 'playlists#addTrackToPlaylist', as: 'add_track_to_playlist'
  get 'playlists/:id/artists', to: 'playlists#index'
  # destroy "/playlists/:playlist_id/removeTrack" to: "playlists#destroy", as: "remove_track_from_playlist"

  post 'playlists/:id/searchArtist', to: 'playlists#searchArtist'
  get '/tracks', to: 'tracks#index'
  delete '/tracks', to: 'tracks#destroy', as: "delete_track"

end
