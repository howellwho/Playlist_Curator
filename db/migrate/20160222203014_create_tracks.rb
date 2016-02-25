class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.integer :playlist_id

      t.timestamps null: false
    end
  end
end
