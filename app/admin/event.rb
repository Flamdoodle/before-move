ActiveAdmin.register Event do
  permit_params :time, :date, :number_of_seats, :restaurant_id, :seat_cost, :max_tickets_per_member, :nonmember_code,
    menus_attributes: [:name, :number_of_courses, :description, :id, menu_items_attributes: [:id, :course_number, :name, :description]],
    benefits_attributes: [:benefit]

  form do |f|
    f.inputs "Event Details" do
      f.input :restaurant
      f.input :date, as: :date_picker
      f.input :time, as: :time_picker
      f.input :number_of_seats
      f.input :seat_cost
      f.input :max_tickets_per_member
      f.input :nonmember_code
      f.has_many :benefits do |cf|
        cf.input :benefit
      end
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

    panel "Ticket Info" do
      table_for event.experience do
        column() do |experience|
          "Required minimum spend: $#{experience.minimum_spend}"
        end
      end

      table_for event do
        column() do |event|
          ticket_total = 0
          event.bookings.each do |booking|
            ticket_total += booking.number_of_tickets
          end
          tickets_left = event.experience.number_of_seats - ticket_total
          "This is a #{event.experience.number_of_seats} seat event. There are #{tickets_left} tickets still available."
        end
      end

      table_for event do
        column() do |event|
          ticket_total = 0
          event.bookings.each do |booking|
            ticket_total += booking.number_of_tickets
          end
          restaurant_revenue = ticket_total * event.seat_cost
          "#{ticket_total} tickets sold ($#{restaurant_revenue} revenue)"
        end
      end

      table_for event.bookings do
        column() do |booking|
          "A party of #{booking.number_of_tickets}"
        end
      end
    end

    panel "Guest List Information" do
      table_for event.bookings do
        column("Name") do |booking|
          link_to("#{booking.user.name}", admin_member_path(booking.user))
        end

        column("Status") do |booking|
          if booking.user
            "Member"
          else
            "Guest of #{booking.user}"
          end
        end

        column("Email") do |booking|
          booking.user.email
        end

        column("Phone Number") do |booking|
          booking.user.phone_number
        end

        column("Date/Time Purchased") do |booking|
          booking.created_at.strftime("%B %e at %l:%M%p %Z")
        end

        column("Edit") do |booking|
          link_to("Edit", edit_admin_ticket_path(booking)) + "/" + link_to("Delete", admin_ticket_path(booking), method: 'delete')
        end
      end
    end
  end
end
