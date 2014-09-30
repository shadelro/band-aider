brent = User.find_or_create_by(email: 'brent@yopmail.com', name: 'Brent Shadel') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin!
end

divi = User.find_or_create_by(email: 'divi@yopmail.com', name: 'Divyansh Bhatnagar') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin!
end

chris = User.find_or_create_by(email: 'chris@yopmail.com', name: 'Chris Belsole') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin!
end

adam = User.find_or_create_by(email: 'adam@yopmail.com', name: 'Adam Adamson') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin!
end

alex_sons = Band.find_or_create_by(name: 'Alex Sons')
dung_beetle = Band.find_or_create_by(name: 'Dung Beetle')

slave = Song.find_or_create_by(band: alex_sons, name: 'I Am Not a Slave')
light = Song.find_or_create_by(band: alex_sons, name: 'Light at the End of the Tunnel')
ready = Song.find_or_create_by(band: alex_sons, name: 'Ready to Go')

Membership.find_or_create_by(user: brent, band: alex_sons)
Membership.find_or_create_by(user: divi, band: alex_sons)
Membership.find_or_create_by(user: chris, band: alex_sons)

Invitation.find_or_create_by(user: brent, band: dung_beetle)
Invitation.find_or_create_by(user: divi, band: dung_beetle)
Invitation.find_or_create_by(user: chris, band: dung_beetle)
