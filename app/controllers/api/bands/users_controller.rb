module Api
  module Bands
    class UsersController < ApiController
      def show
        @membership = Membership.find_by(band_id: params[:band_id], user_id: params[:id])
      end

      def index
        @memberships = Band.find(params[:band_id]).memberships
      end
    end
  end
end
