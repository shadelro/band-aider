class MembershipPolicy
  attr_reader :user, :membership

  def initialize(user, membership)
    @user = user
    @membership = membership
  end

  def create?
    membership.user == @user
  end

  def edit?
    membership.user == @user
  end

  def update?
    edit?
  end

  def destroy?
    create?
  end
end
