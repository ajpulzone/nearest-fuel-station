class FuelFacade
  #this facade is combining both services and combining it into one
  def self.search_station(location)
    station_data = StationService.closest_station(location)
    station_data[:fuel_stations].map do |station|
      station_info = Station.new(station).formatted_address

      gps_info = GPSService.directions(location, station_info)
      gps_info[:route][:legs].map do |route_info|
        Fuel.new(station, route_info)
      end 
    end
  end
end