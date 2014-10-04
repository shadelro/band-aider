class AddAttachmentMediaToTracks < ActiveRecord::Migration
  def self.up
    change_table :tracks do |t|
      t.attachment :media
    end
  end

  def self.down
    remove_attachment :tracks, :media
  end
end
