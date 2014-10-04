class TrackPolicy
  attr_reader :user, :track

  def initialize(user, track)
    @user = user
    @track = track
  end

  def create?
    track.song.band.members.include?(@user)
  end

  def destroy?
    track.song.band.members.include?(@user)
  end
end
