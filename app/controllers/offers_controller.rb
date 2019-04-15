class OffersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @offer = current_user.offers.build if logged_in?
  end

  def show_all
    @offers = Offer.all.paginate(page: params[:page], per_page: 5)
  end





  def create
    @offer = current_user.offers.build(offers_params)
    if @offer.save
      flash[:success] = "Offer created!"
      redirect_to root_url
    else
      render 'offers/new'
    end
  end

  def destroy
  end

  private

  def offers_params
    params.require(:offer).permit(:content)
  end
end

