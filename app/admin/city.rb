ActiveAdmin.register City do
  permit_params :name, :state_id
  menu parent: "Other"
end
