json.id band.id
json.name band.name
json.description band.description
json.members band.memberships, partial: 'api/bands/user', as: :membership, band: band
json.songs band.songs, partial: 'api/bands/song', as: :song
