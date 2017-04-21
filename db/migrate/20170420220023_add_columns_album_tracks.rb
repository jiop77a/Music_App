class AddColumnsAlbumTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :recording_style, :string, presence: true
    add_column :tracks, :style, :string, presence: true
    add_column :tracks, :lyrics, :string

  end
end
