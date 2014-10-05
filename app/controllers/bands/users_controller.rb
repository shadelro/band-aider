module Bands
  class UsersController < ApplicationController
    def show
      @membership = Membership.find_by(band_id: params[:band_id], user_id: params[:id])
      @band = @membership.band
      @user = @membership.user
    end
  end
end
