class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vehicle_name, :vehicle_type, :vehicle_number
  
end
