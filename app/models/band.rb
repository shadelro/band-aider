class Band < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  has_many :invitations, dependent: :destroy

  has_many :songs

  validates :name, uniqueness: true
end
