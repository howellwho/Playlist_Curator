class AddSpotifyIdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :spotify_track_id, :string
  end
end
