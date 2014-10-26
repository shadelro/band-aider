json.id user.id
json.name user.name
json.bands user.bands, partial: 'api/users/band', as: :band
json.invitations user.invitations, partial: 'api/users/invitation', as: :invitation
