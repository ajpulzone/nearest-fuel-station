class Station
  attr_reader :name, :street_address, :city, :state, :zip_code, :fuel_type, :hours

  def initialize(station_data)
    @name = station_data[:station_name].to_s
    @street_address = station_data[:street_address]
    @city = station_data[:city]
    @state = station_data[:state] 
    @zip_code = station_data[:zip]
    @fuel_type = station_data[:fuel_type_code]
    @hours = station_data[:access_days_time]
  end

  def formatted_address
    @street_address + ", " + @city + ", " + @state + ", " + @zip_code
  end
end