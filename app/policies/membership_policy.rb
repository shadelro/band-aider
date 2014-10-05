class MembershipPolicy
  attr_reader :user, :membership

  def initialize(user, membership)
    @user = user
    @membership = membership
  end

  def create?
    membership.user == @user
  end

  def destroy?
    create?
  end
end
