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

  def edit
    @offer = Offer.find(params[:format])
  end

  def search
    if params[:date_start].empty?
      params[:date_start] = Time.zone.now.beginning_of_day
    end
    if params[:date_end].empty?
      params[:date_end] = Float::INFINITY
    end
    if params[:search].empty?
      @offers = Offer.select("offers.*, categories.name as cat_name, states.name as s_name, cities.name as c_name")
                    .joins("LEFT JOIN categories ON categories.id = offers.category_id")
                    .joins("LEFT JOIN states ON states.id = offers.state_id")
                    .joins("LEFT JOIN cities ON cities.id = offers.city_id")
                    .where("date >= ? and date<= ?", params[:date_start], params[:date_end])
                    .order(:date)
                    .paginate(page: params[:page], per_page: 10)
    else
      @offers = Offer.select("offers.*, categories.name as cat_name, tab.*")
                    .joins("LEFT JOIN categories ON categories.id = offers.category_id")
                    .joins("INNER JOIN (SELECT states.id as s_id, states.name as s_name ,cities.name as c_name from states
                                         LEFT JOIN cities ON cities.state_id = states.id
                                         WHERE states.name = '#{params[:search]}' or cities.name = '#{params[:search]}') as tab
                            ON tab.s_id = offers.state_id")
                    .where("date BETWEEN ? and ?", params[:date_start], params[:date_end])
                    .order(:date)
                    .paginate(page: params[:page], per_page: 10)
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
    Offer.transaction do
      begin
        Offer.find(params[:id]).destroy
        flash[:success] = "Offer deleted."
      rescue
        flash[:alert] = "Something went wrong! :("
      end
    end
    redirect_to pages_home_path
  end

  def user_offers
    @offers = Offer.select("offers.*, categories.name as cat_name, states.name as s_name, cities.name as c_name")
                                   .joins("LEFT JOIN categories ON categories.id = offers.category_id")
                                   .joins("LEFT JOIN states ON states.id = offers.state_id")
                                   .joins("LEFT JOIN cities ON cities.id = offers.city_id")
                                   .where(user: current_user)
                                   .order(:date)
                                   .paginate(page: params[:page], per_page: 10)
  end


  def show
    @offer = Offer.select("offers.*, categories.name as cat_name,
                            states.name as s_name, provinces.name as p_name,
                            cities.name as c_name, count(ao.offer_id)")
                 .joins("LEFT JOIN accepted_offers as ao ON offers.id = ao.offer_id")
                 .joins("LEFT JOIN categories ON categories.id = offers.category_id")
                 .joins("LEFT JOIN states ON states.id = offers.state_id")
                 .joins("LEFT JOIN provinces ON provinces.id = offers.province_id")
                 .joins("LEFT JOIN cities ON cities.id = offers.city_id")
                 .group("offers.id, cat_name, s_name,p_name,c_name").find(params[:id])
    if logged_in? && current_user?(@offer.user)
      @applies = AcceptedOffer.where(offer_id: @offer.id)
    end
  end


  private

  def offers_params
    params.require(:offer).permit(:content, :label, :date, :state_id, :wage,   :province_id, :city_id)
  end
end

