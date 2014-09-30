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

idiot_energy = Band.find_or_create_by(name: 'Idiot Energy')
dung_beetle = Band.find_or_create_by(name: 'Dung Beetle')

Membership.find_or_create_by(user: brent, band: idiot_energy)
Membership.find_or_create_by(user: divi, band: idiot_energy)
Membership.find_or_create_by(user: chris, band: idiot_energy)

Invitation.find_or_create_by(user: brent, band: dung_beetle)
Invitation.find_or_create_by(user: divi, band: dung_beetle)
Invitation.find_or_create_by(user: chris, band: dung_beetle)
