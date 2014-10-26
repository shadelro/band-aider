class UserMailer < ActionMailer::Base
  default from: 'bandaider@bandaider.tk'

  def band_invitation_email(invitation)
    @invitation = invitation

    mail to: @invitation.user.email, subject: "You've been invited to join #{@invitation.band.name}!"
  end
end
