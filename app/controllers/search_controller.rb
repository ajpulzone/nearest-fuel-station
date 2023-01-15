class SearchController < ApplicationController

  def index
    @stations = StationFacade.search_station(params[:location])
    @final_destination = @stations[0].formatted_address
    @gps = GPSFacade.directions(params[:location], @final_destination)
  end 
end