module Bands
  class BandsController < ApplicationController
    def index
      @bands = Band.all
    end

    def show
      @band = Band.find(params[:id])
      @membership = Membership.new
      @users_to_invite = User.where.not(id: @band.members.map(&:id))
    end
  end
end
