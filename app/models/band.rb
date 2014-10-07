class Band < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  has_many :invitations, dependent: :destroy
  has_many :songs, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  def has_member?(user)
    members.include? user
  end

  def invitable_users
    User.where.not(id: (memberships.map(&:user_id) + invitations.map(&:user_id)).flatten)
  end
end
