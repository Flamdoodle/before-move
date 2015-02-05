ActiveAdmin.register SpaceOption do
  permit_params :name
  menu parent: "Other"
end
