class Track < ActiveRecord::Base
  belongs_to :song

  has_attached_file :media
  validates_attachment :media, content_type: {content_type: 'audio/mp3'}
end
