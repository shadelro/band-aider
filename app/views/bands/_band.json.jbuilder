json.name band.name
json.members band.members, partial: 'bands/user', as: :user, band: band
json.songs band.songs, partial: 'bands/song', as: :song, band: band
json.url url_for(band)
