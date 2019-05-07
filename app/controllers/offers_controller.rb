class OffersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @offer = current_user.offers.build if logged_in?
    @states = State.all
    @provinces = []
    @cities = []
    if params[:state].present?
      @provinces = State.find(params[:state]).provinces
    end
    if params[:province].present?
      @cities = Province.find(params[:province]).cities
    end
    if request.xhr?
      respond_to do |format|
        format.json {
          render json: {provinces: @provinces, cities: @cities}
        }
      end
    end
  end

  def show_all
    @offers = Offer.all.paginate(page: params[:page], per_page: 5)
  end


  def search
    if params.present?
      @offers = State.where(label: params[:search]).provinces + State.where(name: params[:search]).provinces

    else
      @offers = Offer.all
    end
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

