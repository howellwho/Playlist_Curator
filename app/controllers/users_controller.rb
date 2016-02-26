class UsersController < ApplicationController
  def spotify
    # p params['code']
   @spotify_user = RSpotify::User.new(params['code'])
   render :show
  end

  def spotify_auth
    # redirect_to "https://accounts.spotify.com/authorize" + "?client_id=1346712e0b264189aac468ff626623e6&response_type=code&redirect_uri=http:127.0.0.1:3000/auth/spotify/callback"
    redirect_to "https://accounts.spotify.com/authorize/?client_id=#{ENV['SPOTIFY_CLIENT_ID']}&response_type=code&redirect_uri=#{request.original_url}"
  end
end
