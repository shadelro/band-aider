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

idiot_energy = Band.find_or_create_by(name: 'Idiot Energy')

Membership.find_or_create_by(user: brent, band: idiot_energy)
Membership.find_or_create_by(user: divi, band: idiot_energy)
