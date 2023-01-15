class GPSFacade
  def self.directions(location, final_destination)
    data = GPSService.directions(location, final_destination)
    data[:route][:legs].map do |route_info|
      GPS.new(route_info)
    end
  end
end