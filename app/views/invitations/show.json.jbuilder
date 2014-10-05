json.partial! 'invitations/band', band: @invitation.band
json.partial! 'invitations/user', user: @invitation.user
json.url url_for(@invitation)
