class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :band

  validates :user_id, uniqueness: {scope: :collaboration_id}
end
