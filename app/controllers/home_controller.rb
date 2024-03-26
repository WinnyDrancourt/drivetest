class HomeController < ApplicationController
  def index
    @itineraries = Itinerary.all.sort_by(&:count_likes).reverse.take(6)
  end
end
