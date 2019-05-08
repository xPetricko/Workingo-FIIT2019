class PagesController < ApplicationController
  def about
  end

  def help
  end

  def home
    if logged_in?
      #asd
    else
      @offers_count = Offer.all.count
      @states_count = ActiveRecord::Base.connection.execute("Select count(*) from (SELECT offers.state_id from offers group by offers.state_id) as temp").values[0][0]
      @cities_count = ActiveRecord::Base.connection.execute("Select count(*) from (SELECT offers.city_id from offers group by offers.city_id) as temp").values[0][0]
      @today_count =  Offer.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count
    end
  end


end
