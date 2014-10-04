class BandPolicy
  attr_reader :user, :band

  def initialize(user, band)
    @user = user
    @band = band
  end

  def update?
    band.members.include? @user
  end
end
