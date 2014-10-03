class AddAttachmentChartToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :chart
    end
  end

  def self.down
    remove_attachment :songs, :chart
  end
end
