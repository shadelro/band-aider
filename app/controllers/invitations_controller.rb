class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @invitation = Invitation.find(params[:id])
    authorize @invitation

    @new_membership = Membership.new(band_id: @invitation.band.id, user_id: @invitation.user.id)
  end

  def create
    invitation = Invitation.new(invitation_params)
    authorize invitation

    if invitation.save
      @invitation = Invitation.find(invitation.id)
      respond_to do |format|
        format.html {
          flash[:notice] = 'User invited'
          redirect_to @invitation.band
        }
        format.json { }
      end
    else
      repond_to do |format|
        format.html {
          flash[:error] = 'Could not invite user'
          redirect_to invitation.band
        }
        format.json { render json: {errors: invitation.errors.full_messages}.to_json, status: 400 }
      end
    end
  end

  def destroy
    invitation = Invitation.find(params[:id])
    authorize invitation

    if invitation.destroy
      respond_to do |format|
        format.html {
          flash[:notice] = 'Invitation turned down'
          redirect_to current_user
        }
        format.json { render nothing: true, status: 204 }
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = "An error occurred; you're still invited"
          redirect_to invitation
        }
        format.json { render json: {errors: invitation.errors.full_messages}.to_json, status: 400 }
      end
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:band_id, :user_id)
  end
end
