class SongPolicy
  attr_reader :user, :song

  def initialize(user, song)
    @user = user
    @song = song
  end

  def show?
    song.band.members.include? @user
  end

  def new?
    song.band.members.include? @user
  end

  def create?
    new?
  end

  def edit?
    song.band.members.include? @user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
