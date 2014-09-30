brent = User.find_or_create_by(email: 'brent@yopmail.com', name: 'Brent Shadel') do |user|
  user.email = 'brent@yopmail.com'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin!
end

divi = User.find_or_create_by(email: 'divi@yopmail.com', name: 'Divyansh Bhatnagar') do |user|
  user.email = 'divi@yopmail.com'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin!
end

chris = User.find_or_create_by(email: 'chris@yopmail.com', name: 'Chris Belsole') do |user|
  user.email = 'chris@yopmail.com'
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

slave = Song.find_or_create_by(
  band: alex_sons,
  name: 'I Am Not a Slave',
  lyrics: "I am not a slave anymore\nSin has lost its hold on me\nI will seek the name of the Lord\nSo that everyone will see\nI am not a slave"
)
light = Song.find_or_create_by(
  band: alex_sons,
  name: 'Light at the End of the Tunnel',
  lyrics: "Light at the end of tunnel\nStars in the sky so deep\nSavior when I'm in trouble\nYou're the reason I believe"
)
ready = Song.find_or_create_by(
  band: alex_sons,
  name: 'Ready to Go',
  lyrics: "I'm ready to go"
)

Membership.find_or_create_by(user: brent, band: alex_sons)
Membership.find_or_create_by(user: divi, band: alex_sons)
Membership.find_or_create_by(user: chris, band: alex_sons)

Invitation.find_or_create_by(user: brent, band: dung_beetle)
Invitation.find_or_create_by(user: divi, band: dung_beetle)
Invitation.find_or_create_by(user: chris, band: dung_beetle)
