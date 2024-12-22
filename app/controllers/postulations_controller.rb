class PostulationsController < ApplicationController
  before_action :authenticate_user!

  def user_postulation
    @user = current_user
    @offer = Offer.find(params[:offer_id])
      postulation = Postulation.find_by(user_id: @user.id, offer_id: @offer.id)
      if postulation
        flash.now[:alert] = "Ya postulaste a esta oferta"
      else
        @new_postulation = Postulation.new(user_id: @user.id, offer_id: @offer.id, status: params[:status])
        respond_to do |format|
          if @new_postulation.save!
            format.html { redirect_to offer_path(@offer), notice: "#{current_user.email} usted ha logrado #{@new_postulation.status} a esta oferta" }
          else
            format.html { redirect_to post_path(@offer), status: :unprocessable_entity }
          end
        end
      end
  end
  def offer_with_postulations
    @postulations = current_user.postulations
    offer_ids = @postulations.map(&:offer_id)
    @offers = Offer.where(id: offer_ids)
  end
end
