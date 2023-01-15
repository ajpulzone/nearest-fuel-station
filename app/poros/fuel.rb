class Fuel
  attr_reader :distance, :time, :directions, :name, :street_address, :city, :state, :zip_code, :fuel_type, :hours

  def initialize(station_data, gps_data)
    @name = station_data[:station_name].to_s
    @street_address = station_data[:street_address]
    @city = station_data[:city]
    @state = station_data[:state] 
    @zip_code = station_data[:zip]
    @fuel_type = station_data[:fuel_type_code]
    @hours = station_data[:access_days_time]
    @distance = gps_data[:distance]
    @time = gps_data[:time]
    @directions = gps_data[:maneuvers].pluck(:narrative)
  end

  def format_address
    @street_address + ", " + @city + ", " + @state + ", " + @zip_code
  end

  def travel_info     
    {
      "Distance": "#{self.distance}",
      "Travel_time": "#{self.time}",
      "Directions": self.directions.map {|direction| direction}.to_sentence
    }   
  end
end
