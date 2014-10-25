class TracksController < ApplicationController
  before_filter :authenticate_user!

  def create
    track = Track.new(track_params)
    authorize track

    if track.save
      flash[:notice] = 'Track created'
    else
      flash[:error] = 'Could not create track'
    end

    redirect_to band_song_path(track.song.band, track.song)
  end

  def destroy
    track = Track.find(params[:id])
    authorize track

    song = track.song

    if track.destroy
      flash[:notice] = 'Track destroyed'
    else
      flash[:error] = 'Could not destroy track'
    end

    redirect_to band_song_path(band_id: song.band.id, id: song.id)
  end

  private

  def track_params
    params.require(:track).permit(:song_id, :media)
  end
end
