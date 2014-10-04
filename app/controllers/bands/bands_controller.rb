module Bands
  class BandsController < ApplicationController
    def index
      @bands = Band.all
    end

    def show
      @band = Band.find(params[:id])
      @my_membership = Membership.find_by(band: @band, user: current_user)
      @membership = Membership.new
      @users_to_invite = User.where.not(id: @band.members.map(&:id))
    end
  end
end
