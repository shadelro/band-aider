class BandPolicy
  attr_reader :user, :band

  def initialize(user, band)
    @user = user
    @band = band
  end

  def show_songs?
    band.members.include? @user
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    band.members.include? @user
  end

  def update?
    edit?
  end

  def destroy?
    band.members.include? @user
  end
end
