require "rails_helper"

RSpec.describe "Stations Poros" do

  describe "attributes" do
    it "exists and has attributes" do
      attributes = {city: "Edgewater", fuel_type: "ELEC", hours: "24 hours daily", name: "Target T2225", state: "CO", street_address: "1985 Sheridan Blvd", zip_code: "80214"}
      
      # station = Station.new(attributes)

      # expect(station).to be_an_instance_of(Station)
      # expect(station.id).to eq("10-barrel-brewing-co-bend-1")
      # expect(station.name).to eq("10 Barrel Brewing Co")
      # expect(station.street_address).to eq("62970 18th St")
      # expect(station.city).to eq("Bend")
      # expect(station.state).to eq("Oregon")
      # expect(station.zip_code).to eq("97701-9847")
      # expect(station.phone_number).to eq("5415851007")
      # expect(station.website).to eq("https://www.deschutesstation.com/")
      # expect(station.type).to eq("micro")
    end
  end 
end