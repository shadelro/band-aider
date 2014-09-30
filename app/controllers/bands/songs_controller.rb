module Bands
  class SongsController < ApplicationController
    def index
      band = Band.find(params[:band_id])
      @songs = band.songs
    end

    def show
      @band = Band.find(params[:band_id])
      @song = Song.find(params[:id])
    end

    def new
      @band = Band.find(params[:band_id])
      @song = Song.new(band_id: @band.id)
    end

    def create
      song = Song.new(song_params)

      if song.save
        redirect_to band_song_path(song.band_id, song)
      else
        redirect_to new_band_song_path(band)
      end
    end

    def edit
      @band = Band.find(params[:band_id])
      @song = Song.find_by(band_id: @band.id, id: params[:id])
    end

    def update
      song = Song.find_by(band_id: params[:band_id], id: params[:id])

      if song.update(song_params)
        redirect_to band_song_path(song.band_id, song)
      else
        redirect_to new_band_song_path(band)
      end
    end

    def destroy
      song = Song.find_by(band_id: params[:band_id], id: params[:id])

      if song.destroy
        redirect_to band_path(params[:band_id])
      else
        redirect_to band_path(params[:band_id])
      end
    end

    private

    def song_params
      params.require(:song).permit(:name, :lyrics, :band_id)
    end
  end
end
