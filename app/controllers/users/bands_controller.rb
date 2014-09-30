module Users
  class BandsController < ApplicationController
    def index
      user = User.find(params[:user_id])
      @bands = user.bands
    end
  end
end
