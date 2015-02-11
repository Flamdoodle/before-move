ActiveAdmin.register CuisineType do
  permit_params :name
  menu parent: "Other"
end
