ActiveAdmin.register Event do
  permit_params :time, :date, :number_of_seats, :restaurant_id, :seat_cost, :max_tickets_per_member, :nonmember_code,
    menus_attributes: [:name, :number_of_courses, :description, :id, menu_items_attributes: [:id, :course_number, :name, :description]]

  form do |f|
    f.inputs "Event Details" do
      f.input :restaurant
      f.input :date, as: :date_picker
      f.input :time, as: :time_picker
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

  show do
    panel "Basic Info" do
      attributes_table_for event do
        row :seat_cost, as: "Ticket Price"
        row :gratuity, as: "Gratuity"
        row :max_tickets_per_member
      end
    end

    panel "Menu Info" do
      attributes_table_for event.menus do
        row :name
        row :description
        row :number_of_courses
      end

      table_for event.menus do
        column("First Course") do |menu|
          attributes_table_for menu.menu_items.where(course_number: 1) do
            row :name
            row :description
          end
        end
      end

      table_for event.menus do
        column("Second Course") do |menu|
          attributes_table_for menu.menu_items.where(course_number: 2) do
            row :name
            row :description
          end
        end
      end

      table_for event.menus do
        column("Third Course") do |menu|
          attributes_table_for menu.menu_items.where(course_number: 3) do
            row :name
            row :description
          end
        end
      end
    end
  end
end
