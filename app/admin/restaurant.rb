ActiveAdmin.register Restaurant do
  permit_params :name, :street_address, :zipcode, :city_id, :neighborhood, :cuisine_type, :description, :gratuity
end
