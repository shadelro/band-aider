module InvitationsHelper
  def my_invitations_label
    "Invitations (#{current_user.invitations.count})"
  end
end
