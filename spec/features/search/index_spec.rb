require "rails_helper"

RSpec.describe "Search Index Page" do
  describe "finding the nearest fuel station" do
    before(:each) do
      visit "/"

      select("Griffin Coffee", from: :location)
      click_button("Find Nearest Station")
      @station = StationFacade.search_station("5224 W 25th Ave, Denver, CO 80214")
    end 

    it "when the user visits the welcome page and selects an option from the 
      location drop down menu, clicks 'Find Nearest Gas Station', they are taken
      to the search index page" do

        expect(current_path).to eq("/search")
    end

    it "on the search index page they see the closest electric fuel station to the user with attributes" do

      expect(page).to have_content(@station[0].name)
      expect(page).to have_content(@station[0].formatted_address)
      expect(page).to have_content(@station[0].fuel_type)
      expect(page).to have_content(@station[0].hours)
    end

    it "and the user should see the distance to the nearest fuel station, how many miles away it is and
      directions to get to that fuel station" do
        @gps = GPSFacade.directions("5224 W 25th Ave, Denver, CO 80214", "1985 Sheridan Blvd., Edgewater, CO, 80214").first

        expect(page).to have_content("Distance to Destination: #{@gps.distance} miles")
        expect(page).to have_content("Time to Destination: #{@gps.time} minutes")
        expect(page).to have_content(@gps.directions[0])
        expect(page).to have_content(@gps.directions[1])
        expect(page).to have_content(@gps.directions[2])
    end
  end
end