json.name band.name
json.members band.memberships, partial: 'bands/user', as: :membership, band: band
json.songs band.songs, partial: 'bands/song', as: :song, band: band
json.url url_for(band)
