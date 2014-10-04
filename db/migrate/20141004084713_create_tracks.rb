class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :song_id

      t.timestamps
    end
  end
end
