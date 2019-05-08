class OffersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @offer = Offer.new
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
      State.where("name like ?", params[:search]).each do |state|
        temp = state.offers
        if temp.nil?
          @offers += temp
        end
      end
      City.where("name like ?", params[:search]).each do |city|
        temp = city.offers
        if temp.nil?
          @offers += temp
        end
      end

    else
      @offers = Offer.all
    end
  end




  def create
    @offer = current_user.offers.build(offers_params)
    @offer.category_name= (params[:offer][:category_name])
    if @offer.save
      flash[:success] = "Offer created!"
      redirect_to root_url
    else
      flash[:success] = @offer
      redirect_to offers_new_path
    end
  end

  def destroy
  end

  private

  def offers_params
    params.require(:offer).permit(:content, :state_id, :province_id, :city_id)
  end
end

