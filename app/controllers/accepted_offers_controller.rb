class AcceptedOffersController < ApplicationController
  def create
    @apply = AcceptedOffer.new(name: params[:name],offer_id: params[:offer_id], contact: params[:contact])
    @offer = Offer.find(params[:offer_id])
    if @apply.save
      flash[:success] = "Applied!"
      redirect_to  @offer
    else
      flash[:danger] = "Incorect data."
      redirect_to @offer
    end
  end
end
