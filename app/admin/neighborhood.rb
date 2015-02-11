ActiveAdmin.register Neighborhood do
  permit_params :name, :city_id
  menu parent: "Other"
end
