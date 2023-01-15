require "rails_helper"

RSpec.describe "fuel endpoint" do
  it "builds fuel endpoint" do
    get "/api/v1/nearest_fuel?location=denver,co"

    expect(response).to be_successful

    fuel = JSON.parse(response.body, symbolize_names: true)

    expect(fuel).to be_a(Hash)
    expect(fuel[:data][0]).to have_key(:id)
    expect(fuel[:data][0]).to have_key(:type)
    expect(fuel[:data][0][:type]).to be_a(String)
    expect(fuel[:data][0]).to have_key(:attributes)
    expect(fuel[:data][0][:attributes]).to be_a(Hash)
    expect(fuel[:data][0][:attributes]).to have_key(:distance)
    expect(fuel[:data][0][:attributes][:distance]).to be_a(Float)
    expect(fuel[:data][0][:attributes]).to have_key(:time)
    expect(fuel[:data][0][:attributes][:time]).to be_a(Integer)
    expect(fuel[:data][0][:attributes]).to have_key(:directions)
    expect(fuel[:data][0][:attributes][:directions]).to be_a(Array)
    expect(fuel[:data][0][:attributes]).to have_key(:name)
    expect(fuel[:data][0][:attributes][:name]).to be_a(String)
    expect(fuel[:data][0][:attributes]).to have_key(:fuel_type)
    expect(fuel[:data][0][:attributes][:fuel_type]).to be_a(String)
    expect(fuel[:data][0][:attributes]).to have_key(:hours)
    expect(fuel[:data][0][:attributes][:hours]).to be_a(String)
    expect(fuel[:data][0][:attributes]).to have_key(:entire_address)
    expect(fuel[:data][0][:attributes][:entire_address]).to be_a(String)
    expect(fuel[:data][0][:attributes]).to have_key(:travel_information)
    expect(fuel[:data][0][:attributes][:travel_information]).to be_a(Hash)
   end
end