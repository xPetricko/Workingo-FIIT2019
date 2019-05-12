class StatisticsController < ApplicationController

  def main
  end

  def by_categories
    @results = Category.select("categories.name, count(o.id) as offer_count")
                   .joins("LEFT JOIN offers as o ON o.category_id = categories.id")
                   .group("categories.name").order("offer_count desc, categories.name")
                   .paginate(page: params[:page], per_page: 20)
  end

  def by_states
    @results = State.select("states.id, states.name, count(o.id) as offer_count")
                   .joins("LEFT JOIN offers as o ON o.state_id = states.id")
                   .group("states.name, states.id").order("offer_count desc, states.name")
                   .paginate(page: params[:page], per_page: 20)
  end

  def by_cities
    @results = City.select("cities.name, count(o.id)")
                   .joins("LEFT JOIN offers as o ON o.city_id = cities.id")
                   .group("cities.name").order("count desc, cities.name").where("cities.state_id = ?", params[:id])
                   .paginate(page: params[:page], per_page: 20)


  end

end
