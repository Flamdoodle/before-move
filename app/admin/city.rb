ActiveAdmin.register City do
  permit_params :name, :state
  menu parent: "Other"
end
