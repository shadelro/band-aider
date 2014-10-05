class Song < ActiveRecord::Base
  belongs_to :band
  has_many :tracks, dependent: :destroy

  has_attached_file :chart, styles: {thumbnail: ['340x440#', :png]}
  validates_attachment :chart, content_type: {content_type: 'application/pdf'}

  validates :name, uniqueness: true, presence: true
end
