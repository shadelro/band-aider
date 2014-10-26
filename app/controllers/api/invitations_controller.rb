module Api
  class InvitationsController < ApiController
    def show
      @invitation = Invitation.find(params[:id])
      authorize @invitation
    end

    def create
      @invitation = Invitation.new(invitation_params)
      authorize @invitation

      if @invitation.save
        render :show
      else
        render json: {errors: @invitation.errors.full_messages}.to_json, status: 400
      end
    end

    def destroy
      invitation = Invitation.find(params[:id])
      authorize invitation

      if invitation.destroy
        render nothing: true, status: 204
      else
        render json: {errors: invitation.errors.full_messages}.to_json, status: 400
      end
    end

    private

    def invitation_params
      params.permit(:band_id, :user_id)
    end
  end
end
