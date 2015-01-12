ActiveAdmin.register Restaurant do
  permit_params :name, :street_address, :zipcode, :city_id, :neighborhood, :cuisine_type, :description, :gratuity,
    contacts_attributes: [:id, :name, :title, :email, :phone_number, :is_primary?],
    restaurant_space_options_attributes: [:id, :number_of_seats, :minimum_spend, space_options_attributes: [:id, :space_option, :minimum_spend, :number_of_seats]]
    space_options_attributes: [:id, :space_option, :minimum_spend, :number_of_seats],
    accolades_attributes: [:id, :name],
    awardings_attributes: [:id]

  index do

  end

  form do |f|
    f.inputs "Basic Info" do
      f.input :name
      f.input :street_address
      f.input :city
      f.input :zipcode
      f.input :neighborhood
      f.input :cuisine_type
      f.input :gratuity
      f.input :description, :input_html => { :rows => 10, :cols => 10 }
      f.inputs do
        f.has_many :accolades, heading: "Add Accolades" do |cf|
          cf.input :name
        end
      end
    end

# THIS WILL CHANGE WHEN THE SPACE OPTIONS ARE WORKED OUT # FIXTHIS

    # f.inputs "Dining Info" do
    #   f.has_many :dining_options, heading: false do |cf|
    #     cf.input :required_deposit
    #     cf.input :admin_fee
    #     cf.has_many :space_options, heading: "Space Option Info" do |ccf|
    #       ccf.input :space_option
    #       ccf.input :minimum_spend
    #       ccf.input :number_of_seats
    #     end
    #   end
    # end

    f.inputs "Restaurant Contacts" do
      f.has_many :contacts, heading: false do |cf|
        cf.input :name
        cf.input :title
        cf.input :email
        cf.input :phone_number
        cf.input :is_primary?
      end
    end

    f.actions
  end

  show do
    panel "Basic Info" do
      attributes_table_for restaurant do
        row :street_address
        row :city
        row :zipcode
        row :neighborhood
        row :cuisine_type
        row :description
      end

      table_for restaurant.accolades do
        column("Accolades") { |accolade| accolade.name }
      end
    end

    panel "Dining Info" do
      attributes_table_for restaurant do
        row :gratuity
        row :required_deposit
        row :admin_fee
      end

      table_for restaurant.space_options do
        column(:space_option) { |space_option| space_option.space_option }
        column(:number_of_seats) { |space_option| space_option.number_of_seats }
        column(:minimum_spend) { |space_option| space_option.minimum_spend }
      end
    end

    panel "Restaurant Contact" do
      table_for restaurant.contacts do
        column("Primary Conact") do |contact|
          if contact.is_primary?
            attributes_table_for contact do
              row :name
              row :title
              row :email
              row :phone_number
            end
          end
        end
      end

      table_for restaurant.contacts do
        column("Secondary Conact") do |contact|
          if !contact.is_primary?
            attributes_table_for contact do
              row :name
              row :title
              row :email
              row :phone_number
            end
          end
        end
      end
    end

    panel "TC Events" do
      tabs do
        tab "Upcoming Events - #{restaurant.events.where("date > ?", Time.now).count}" do
          table_for restaurant.events.where("date > ?", Time.now) do
            column("Date/Time") do |event|
              link_to("#{event.date} at #{event.time.strftime("%l:%M%p")}", admin_event_path(event))
            end

            column("Dining Location") do |event|
              event.space_option.space_option
            end

            column("Tickets Sold") do |event|
              ticket_total = 0
              event.bookings.each do |booking|
                ticket_total += booking.number_of_tickets
              end
              "#{ticket_total} out of #{event.number_of_seats}"
            end

            column("Price") do |event|
              "$#{event.seat_cost}"
            end

            column("Menu") do |event|
              "#{event.menus.first.number_of_courses} courses"
            end

            column("Revenue") do |event|
              ticket_total = 0
              event.bookings.each do |booking|
                ticket_total += booking.number_of_tickets
              end
              restaurant_revenue = ticket_total * event.seat_cost
              "$#{restaurant_revenue}"
            end
          end
        end

        tab "Past Events - #{restaurant.events.where("date <= ?", Time.now).count}" do
          table_for restaurant.events.where("date <= ?", Time.now) do
            column("Date/Time") do |event|
              link_to("#{event.date} at #{event.time.strftime("%l:%M%p")}", admin_event_path(event))
            end

            column("Dining Location") do |event|
              event.space_option.space_option
            end

            column("Tickets Sold") do |event|
              ticket_total = 0
              event.bookings.each do |booking|
                ticket_total += booking.number_of_tickets
              end
              "#{ticket_total} out of #{event.number_of_seats}"
            end

            column("Price") do |event|
              "$#{event.seat_cost}"
            end

            column("Menu") do |event|
              "#{event.menus.first.number_of_courses} courses"
            end

            column("Revenue") do |event|
              ticket_total = 0
              event.bookings.each do |booking|
                ticket_total += booking.number_of_tickets
              end
              restaurant_revenue = ticket_total * event.seat_cost
              "$#{restaurant_revenue}"
            end
          end
        end
      end
    end
  end
end
