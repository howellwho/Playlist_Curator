class ArtistsController < ApplicationController
   def index
     p "YAYYYY"
     if !params[:artist_name].empty?
       @artists = RSpotify::Artist.search(params[:artist_name])
      #  redirect_to '/playlist/'
     else
       redirect_to root_path
     end
   end

   def show
     @artists = RSpotify::Artist.search(params[:name])
     if @artists.count != 0
       @artist = @artists.first
       @songs = get_all_songs @artist
       @track = Track.new
       render :show
     else redirect_to playlist_path
     end
  end

  private

  def get_all_songs artist
    songs = []
    albums = artist.albums
    albums.each do |album|
     album.tracks.each {|track| songs << track }
    end
    songs
  end

end
