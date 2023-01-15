class Api::V1::NearestFuelController < ApplicationController
#above is how you clarify the nested sitation that happens with name space

def index
  render json: FuelSerializer.new(FuelFacade.search_station(params[:location]).first)
 end 

end 