class StationFacade

  def self.search_station(location)
    data = StationService.closest_station(location)
    data[:fuel_stations].map do |station|
      Station.new(station)
    end
  end
end