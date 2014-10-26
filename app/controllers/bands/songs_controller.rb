module Bands
  class SongsController < ApplicationController
    before_filter :authenticate_user!, except: [:show, :index]

    def show
      @song = Song.find_by(band_id: params[:band_id], id: params[:id])
      authorize @song

      @band = @song.band
      @new_track = Track.new(song_id: @song.id)
    end

    def index
      @band = Band.find(params[:band_id])
      authorize @band, :show_songs?

      @songs = @band.songs
    end

    def new
      @band = Band.find(params[:band_id])
      @song = Song.new(band_id: @band.id)
      authorize @song
    end

    def create
      band = Band.find(params[:band_id])
      @song = Song.new(song_params.merge(band_id: band.id))
      authorize song

      if @song.save
        flash[:notice] = 'Song created'
        redirect_to band_song_path(@song.band_id, @song)
      else
        flash[:error] = 'Could not create song'
        redirect_to new_band_song_path(@song.band_id, @song)
      end
    end

    def edit
      @band = Band.find(params[:band_id])
      @song = Song.find_by(band_id: @band.id, id: params[:id])
      authorize @song
    end

    def update
      @song = Song.find_by(band_id: params[:band_id], id: params[:id])
      authorize song

      if @song.update(song_params)
        flash[:notice] = 'Song updated'
        redirect_to band_song_path(@song.band_id, @song)
      else
        flash[:error] = 'Could not update song'
        redirect_to new_band_song_path(band)
      end
    end

    def destroy
      song = Song.find_by(band_id: params[:band_id], id: params[:id])
      authorize song

      if song.destroy
        flash[:notice] = 'Song destroyed'
      else
        flash[:error] = 'Could not destroy song'
      end

      redirect_to band_path(params[:band_id])
    end

    private

    def song_params
      params.require(:song).permit(:name, :lyrics, :chart)
    end
  end
end
