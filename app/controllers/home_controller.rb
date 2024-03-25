class HomeController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end
end
