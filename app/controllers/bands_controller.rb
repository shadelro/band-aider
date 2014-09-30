class BandsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      @bands = user.bands
    else
      @bands = Band.all
    end
  end

  def show
    @band = Band.find(params[:id])
  end
end
