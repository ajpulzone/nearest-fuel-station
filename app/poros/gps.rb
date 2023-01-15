class GPS
  attr_reader :distance, :time, :directions

  def initialize(gps_data)
    @distance = gps_data[:distance]
    @time = gps_data[:time]
    @directions = gps_data[:maneuvers].pluck(:narrative)
  end
end