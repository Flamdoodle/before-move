ActiveAdmin.register Event do
  permit_params :date, :number_of_seats, :restaurant_id, :seat_cost, :max_tickets_per_member, :nonmember_code

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs "Event Details" do
      f.input :restaurant
      f.input :date, as: :date_picker
      f.input :number_of_seats
      f.input :seat_cost
      f.input :max_tickets_per_member
      f.input :nonmember_code
    end
    f.inputs do
      f.has_many :menus, heading: "Menu" do |cf|
        cf.input :name
        cf.input :number_of_courses
        cf.input :description
        cf.has_many :menu_items do |ccf|
          ccf.input :course_number
          ccf.input :name
          ccf.input :description
        end
      end
    end
    f.actions
  end


end
