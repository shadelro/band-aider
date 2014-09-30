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
  end
end
