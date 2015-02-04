ActiveAdmin.register Event do
  belongs_to :restaurant, optional: true

  permit_params :time, :date, :number_of_seats, :restaurant_id, :seat_cost, :max_tickets_per_member, :nonmember_code, :menu_name, :menu_description, :number_of_courses, :restaurant_space_option_id,
    menu_items_attributes: [:id, :course_number, :name, :description],
    event_benefit_attributes: [:id],
    benefits_attributes: [:id, :benefit]

  scope("Upcoming Events") { |scope| scope.where("? < date", Time.now) }
  scope("Past Events") { |scope| scope.where("? >= date", Time.now) }

  filter :restaurant_name, as: :string
  filter :space_option, collection: proc { RestaurantSpaceOption.all.map(&:space_option).map(&:name) }
  filter :menu_item
  filter :benefit
  filter :date
  filter :time
  filter :number_of_seats, as: :numeric, collection: proc { RestaurantSpaceOption.all.map(&:number_of_seats) }
  filter :seat_cost
  filter :max_tickets_per_member
  filter :nonmember_code

  index do
    selectable_column
    column(:restaurant) do |event|
      link_to(event.restaurant.name, admin_restaurant_path(event.restaurant))
    end
    column("Date/Time") do |event|
      link_to("#{event.date.strftime("%B %e")} at #{event.time.strftime("%l:%M%p")}", admin_event_path(event))
    end
    column("Number Of Seats") do |event|
      event.number_of_seats
    end
    column(:seat_cost)
    column("Number of Tickets Remaining") do |event|
      ticket_total = 0
      event.bookings.each do |booking|
        ticket_total += booking.number_of_tickets
      end
      tickets_left = event.restaurant_space_option.number_of_seats - ticket_total
      tickets_left
    end
    column(:neighborhood) do |event|
      event.restaurant.neighborhood.name
    end
    column(:city) do |event|
      event.restaurant.city.name
    end
    actions
  end

  form do |f|
    f.inputs "Event Details" do
      f.input :restaurant
      f.input :date, as: :date_picker
      f.input :time, as: :time_picker
      f.input :restaurant_space_option, label: "Space Option", as: :select, collection: option_groups_from_collection_for_select(Restaurant.all, :restaurant_space_options, :name, :id, :space_option_name)
      f.input :number_of_seats
      f.input :seat_cost
      f.input :max_tickets_per_member
      f.input :nonmember_code
      f.has_many :benefits do |cf|
        cf.input :benefit, as: :select, collection: Benefit.all.map(&:benefit), hint: link_to("Create new benefit", new_admin_benefit_path)
      end
    end

    f.inputs "Menu" do
      f.input :menu_name
      f.input :number_of_courses
      f.input :menu_description, :input_html => { :rows => 10, :cols => 10 }
      f.has_many :menu_items, heading: "Menu Items (0 for tasting menu)" do |cf|
        cf.input :course_number
        cf.input :name
        cf.input :description, placeholder: "ex. house bacon"
      end
    end

    f.actions
  end

  show do
    panel "Basic Info" do
      attributes_table_for event do
        row :ticket_price do |event|
          event.seat_cost
        end
        row :gratuity
        row :max_tickets_per_member
        row :space_option, as: "Space Option" do |event|
          event.restaurant_space_option.space_option.name
        end
      end
    end

    panel "Menu Info" do
      attributes_table_for event do
        row :menu_name
        row :menu_description
        row :number_of_courses
      end

      # FIXTHIS this is legacy code from menus, now can be dynamically generated based
      # on how many menu items there are, must fix

      # table_for event.menus do
      #   column("First Course") do |menu|
      #     attributes_table_for menu.menu_items.where(course_number: 1) do
      #       row :name
      #       row :description
      #     end
      #   end
      # end

      # table_for event.menus do
      #   column("Second Course") do |menu|
      #     attributes_table_for menu.menu_items.where(course_number: 2) do
      #       row :name
      #       row :description
      #     end
      #   end
      # end

      # table_for event.menus do
      #   column("Third Course") do |menu|
      #     attributes_table_for menu.menu_items.where(course_number: 3) do
      #       row :name
      #       row :description
      #     end
      #   end
      # end
    end

    panel "Ticket Info" do
      table_for event.restaurant_space_option do
        column() do |space_option|
          "Required minimum spend: $#{space_option.minimum_spend}"
        end
      end

      table_for event do
        column() do |event|
          ticket_total = 0
          event.bookings.each do |booking|
            ticket_total += booking.number_of_tickets
          end
          tickets_left = event.restaurant_space_option.number_of_seats - ticket_total
          "This is a #{event.restaurant_space_option.number_of_seats} seat event. There are #{tickets_left} tickets still available."
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
          link_to("#{booking.member.name}", admin_member_path(booking.member))
        end

        column("Status") do |booking|
          if booking.member
            "Member"
          else
            "Guest of #{booking.member}"
          end
        end

        column("Email") do |booking|
          booking.member.email
        end

        column("Phone Number") do |booking|
          booking.member.phone_number
        end

        column("Date/Time Purchased") do |booking|
          booking.created_at.strftime("%B %e at %l:%M%p %Z")
        end

        column("Edit") do |booking|
          link_to("Edit", edit_admin_ticket_path(booking)) + "/" + link_to("Delete", admin_ticket_path(booking), method: 'delete', data: {confirm: "Are you sure you want to delete this ticket?"})
        end
      end
    end
  end
end
