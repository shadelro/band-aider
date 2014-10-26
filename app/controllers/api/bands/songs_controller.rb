module Api
  module Bands
    class SongsController < ApiController
      def create
        band = Band.find(params[:band_id])
        @song = Song.new(song_params.merge(band_id: band.id))
        authorize @song

        if @song.save
          render :show
        else
          render json: {errors: @song.errors.full_messages}.to_json, status: 400
        end
      end

      def show
        @song = Song.find_by(band_id: params[:band_id], id: params[:id])
        authorize @song
      end

      def index
        @band = Band.find(params[:band_id])
        authorize @band, :show_songs?

        @songs = @band.songs
      end

      def update
        @song = Song.find_by(band_id: params[:band_id], id: params[:id])
        authorize @song

        if @song.update(song_params)
          render :show
        else
          render json: {errors: @song.errors.full_messages}.to_json, status: 400
        end
      end

      def destroy
        song = Song.find_by(band_id: params[:band_id], id: params[:id])
        authorize song

        if song.destroy
          render nothing: true, status: 204
        else
          render json: {errors: song.errors.full_messages}.to_json, status: 400
        end
      end

      private

      def song_params
        params.permit(:name, :lyrics, :chart)
      end
    end
  end
end
