class AddsLyricsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :lyrics, :text, index: true
  end
end
