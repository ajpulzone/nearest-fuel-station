class FuelSerializer
  include JSONAPI::Serializer

  set_id {nil} #this is because not everything that will be returned to us has an id
  attributes :distance, :time, :directions, :name, :fuel_type, :hours

  attribute :entire_address do |address|
    address.format_address
  end

  attribute :travel_information do |travel|
    travel.travel_info
  end
end