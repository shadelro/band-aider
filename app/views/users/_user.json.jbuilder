json.name user.name
json.bands user.bands, partial: 'users/band', as: :band
json.invitations user.invitations, partial: 'users/invitation', as: :invitation
