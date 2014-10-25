json.name band.name
json.description band.description
json.members band.memberships, partial: 'bands/user', as: :membership, band: band
json.songs band.songs, partial: 'bands/song', as: :song
