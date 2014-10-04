class TracksController < ApplicationController
  def create
    track = Track.new(track_params)
    authorize track

    track.save

    redirect_to band_song_path(track.song.band, track.song)
  end

  def destroy
    track = Track.find(params[:id])
    authorize track

    song = track.song
    track.destroy

    redirect_to band_song_path(band_id: song.band.id, id: song.id)
  end

  private

  def track_params
    params.require(:track).permit(:song_id, :media)
  end
end
