class StatisticsController < ApplicationController

  def main
  end

  def by_categories

    @results = Offer.select(:category_id).group(:category_id).count
    @categories = Category.all.paginate(page: params[:page], per_page: 20)
  end

  def by_states
    @results = Offer.select(:state_id).group(:category_id).count
    @states = State.all.paginate(page: params[:page], per_page: 20)
  end
end
