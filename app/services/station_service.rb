class StationService

  def self.conn
    Faraday.new("https://developer.nrel.gov") do |faraday|
      faraday.params["api_key"] = ENV["fuel_api_key"]
    end
  end

  def self.closest_station(location)
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?&location=#{location}&limit=1")
    response_results = JSON.parse(response.body, symbolize_names: true)
  end
end