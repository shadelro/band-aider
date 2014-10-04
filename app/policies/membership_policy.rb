class MembershipPolicy
  attr_reader :user, :membership

  def initialize(user, membership)
    @user = user
    @membership = membership
  end

  def create?
    membership.band.members.include? @user
  end
end
