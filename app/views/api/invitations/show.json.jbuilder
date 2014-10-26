json.id @invitation.id
json.band do
  json.partial! 'api/invitations/band', band: @invitation.band
end
json.user do
  json.partial! 'api/invitations/user', user: @invitation.user
end
