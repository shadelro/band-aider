module Api
  class MembershipsController < ApiController
    def create
      @membership = Membership.new(membership_params)
      authorize @membership

      if @membership.save
        render :show
      else
        render json: {errors: @membership.errors.full_messages}.to_json, status: 400
      end
    end

    def update
      @membership = Membership.find(params[:id])
      authorize @membership

      if @membership.update(membership_params)
        render :show
      else
        render json: {errors: @membership.errors.full_messages}.to_json, status: 400
      end
    end

    def destroy
      membership = Membership.find(params[:id])
      authorize membership

      if membership.destroy
        render nothing: true, status: 204
      else
        render json: {errors: membership.errors.full_messages}.to_json, status: 400
      end
    end

    private

    def membership_params
      params.permit(:band_id, :user_id, :instrument, :bio)
    end
  end
end
