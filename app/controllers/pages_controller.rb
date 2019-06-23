class PagesController < ApplicationController

  def sc_search
    if params[:term].present?
      @results = City.order(:name).where("lower(name) like ?", "#{params[:term].downcase}%") + State.order(:name).where("lower(name) like ?", "#{params[:term].downcase}%")
      render json: @results.map(&:name)
    end
  end

  def cat_search
    if params[:term].present?
      @results = Category.order(:name).where("lower(name) like ?", "#{params[:term].downcase}%")
      render json: @results.map(&:name)
    end
  end

  def about
  end

  def help
  end

  def home
    if logged_in?
      @offers = current_user.offers.where(:active == true).limit(6)
    else
      @offers_count = Offer.all.count
      @states_count = Offer.select(:state_id).distinct.count
      @cities_count = Offer.select(:city_id).distinct.count
      @week_count =  Offer.where(created_at: Time.zone.now.beginning_of_day.ago(7.days)..Time.zone.now).count
    end
  end
end
