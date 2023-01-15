class GPSService

  def self.conn
    Faraday.new("http://www.mapquestapi.com") do |faraday|
      faraday.params["key"] = ENV["map_api_key"]
    end
  end

  def self.directions(location, final_destination)
    response = conn.get("/directions/v2/route?from=#{location}&to=#{final_destination}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end