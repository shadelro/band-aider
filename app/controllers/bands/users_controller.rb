module Bands
  class UsersController < ApplicationController
    def show
      @band = Band.find(params[:band_id])
      @user = User.find(params[:id])
    end
  end
end
