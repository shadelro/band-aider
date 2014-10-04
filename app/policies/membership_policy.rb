class MembershipPolicy
  attr_reader :user, :membership

  def initialize(user, membership)
    @user = user
    @membership = membership
  end

  def create?
    membership.user == @user || membership.band.members.include?(@user)
  end

  def destroy?
    membership.user == @user
  end
end
