class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :band

  validates :user_id, uniqueness: {scope: :collaboration_id}

  after_save :destroy_invitation

  private

  def destroy_invitation
    Invitation.destroy_all(user_id: user_id, collaboration_id: collaboration_id)
  end
end
