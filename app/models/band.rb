class Band < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  has_many :invitations, dependent: :destroy

  validates :name, uniqueness: true
end
