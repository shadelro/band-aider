class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  before_destroy :destroy_bands

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, omniauth_providers: [:google_oauth2]

  has_many :memberships, dependent: :destroy
  has_many :bands, through: :memberships

  has_many :invitations, dependent: :destroy

  validates :email, uniqueness: true, presence: true

  def destroy_bands
    Band.destroy(bands.select { |band| band.members.size == 1 })
  end

  def self.find_for_google_oauth2(auth)
    User.where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
