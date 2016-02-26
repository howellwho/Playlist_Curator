class PlaylistsController < ApplicationController
  # grab the playlist
 def index
   @playlists = Playlist.all
   render :index
 end

 def new
   @playlist = Playlist.new
   render :new
 end

 def create
   Playlist.create(playlist_params)
   redirect_to "/playlists"
 end
#method to inject songs from each unique playlist
 def show
   @playlist = Playlist.find(params[:id])
   @spotifyURL = "https://embed.spotify.com/?uri=spotify:trackset:PREFEREDTITLE:"
   @playlist.tracks.each do |track|
     @spotifyURL << "#{track.spotify_track_id}"
     @spotifyURL << ","
   end

   render :show
 end

 def addTrackToPlaylist
   @playlist = Playlist.find(params[:playlist_id])
   @addTrack = @playlist.tracks.new(track_params) #form information: title, artist, spotify_track_id
    # save the track into db with the playlist reference
   if @addTrack.save
     redirect_to playlist_path(@playlist)
   else
     redirect_to root_path
   end
 end

 def searchArtist
   routeParams={:id=>params[:id], :name => params[:artist_name]}
   redirect_to artist_path(routeParams)
 end


 private
 def track_params
   params.require(:track).permit(:title, :artist, :spotify_track_id)
 end
 def playlist_params
   params.require(:playlist).permit(:name)
 end

end
