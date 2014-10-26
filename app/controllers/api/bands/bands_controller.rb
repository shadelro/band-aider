module Api
  module Bands
    class BandsController < ApiController
      def create
        band = Band.new(band_params)
        authorize band

        if band.save
          Membership.create(band: band, user: current_user)
          @band = Band.find(band.id)

          render :show, status: 201
        else
          render json: {errors: band.errors.full_messages}.to_json, status: 400
        end
      end

      def show
        @band = Band.find(params[:id])
      end

      def index
        @bands = Band.all
      end

      def update
        @band = Band.find(params[:id])
        authorize @band

        if @band.update(band_params)
          render :show
        else
          render json: {errors: @band.errors.full_messages}.to_json, status: 400
        end
      end

      def destroy
        band = Band.find(params[:id])
        authorize band

        if band.destroy
          render nothing: true, status: 204
        else
          render json: {errors: band.errors.full_messages}.to_json, status: 400
        end
      end

      private

      def band_params
        params.permit(:name, :description)
      end
    end
  end
end
