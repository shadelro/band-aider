class InvitationPolicy
  attr_reader :user, :invitation

  def initialize(user, invitation)
    @user = user
    @invitation = invitation
  end

  def show?
    @user == invitation.user
  end

  def create?
    invitation.band.members.include?(@user)
  end

  def destroy?
    @user == invitation.user || create?
  end
end
