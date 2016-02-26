class TracksController < ApplicationController
  def index
   @tracks = Track.all
   render :index
  end

  def create
    Track.create(track_params)
    redirect_to "/playlists"
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    redirect_to :back
  end

  private

  def track_params
    p params
    params.require(:track).permit(:title, :artist, :playlist_id)
  end


end
