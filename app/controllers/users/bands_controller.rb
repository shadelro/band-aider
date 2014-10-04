module Users
  class BandsController < ApplicationController
    before_filter :authenticate_user!

    def index
      user = User.find(params[:user_id])
      @bands = user.bands
    end
  end
end
