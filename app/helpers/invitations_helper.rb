module InvitationsHelper
  def my_invitations_label
    count = current_user.invitations.count
    count > 0 ? "My Invitations (#{count})" : 'My Invitations'
  end
end
