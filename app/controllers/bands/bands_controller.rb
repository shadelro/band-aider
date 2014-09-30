module Bands
  class BandsController < ApplicationController
    def index
      @bands = Band.all
    end

    def show
      @band = Band.find(params[:id])
      @users_not_in_band = User.where.not(id: @band.members.map(&:id)) || []
    end
  end
end
