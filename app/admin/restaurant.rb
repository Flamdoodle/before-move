ActiveAdmin.register Restaurant do
  permit_params :name, :street_address, :zipcode, :city_id, :neighborhood, :cuisine_type, :description, :gratuity, :required_deposit, :admin_fee,
    contacts_attributes: [:id, :name, :title, :email, :phone_number, :is_primary?],
    restaurant_space_options_attributes: [:id, :number_of_seats, :minimum_spend],#, space_options_attributes: [:id, :space_option]],
    space_options_attributes: [:id, :space_option],
    accolades_attributes: [:id, :name]

  filter :accolades, as: :string, collection: proc { Accolade.all }

  index do
    selectable_column
    column(:name) do |restaurant|
      link_to(restaurant.name, admin_restaurant_path(restaurant))
    end
    column(:city)
    column(:neighborhood)
    column("Number Of Tickets") do |restaurant|
      number_of_seats = []
      restaurant.restaurant_space_options.each do |option|
        number_of_seats << option.number_of_seats
      end
      number_of_seats.join("/")
    end
    column("Minimum Spend") do |restaurant|
      minimum_spend = []
      restaurant.restaurant_space_options.each do |option|
        minimum_spend << option.minimum_spend
      end
      minimum_spend.join("/")
    end
    column("Past Events") do |restaurant|
      restaurant.events.where("? < date", Time.now).count
    end
    column("Past Events") do |restaurant|
      restaurant.events.where("? >= date", Time.now).count
    end
    column(:accolades) do |restaurant|
      accolades = []
      restaurant.accolades.each do |accolade|
        accolades << accolade.name
      end
      accolades.join(", ")
    end
  end

  form do |f|
    f.inputs "Basic Info" do
      f.input :name
      f.input :street_address
      f.input :city
      f.input :zipcode
      f.input :neighborhood
      f.input :cuisine_type
      f.input :description, :input_html => { :rows => 10, :cols => 10 }
      f.inputs do
        f.has_many :accolades, heading: "Add Accolades" do |cf|
          cf.input :name
        end
      end
    end

# THIS WILL CHANGE WHEN THE SPACE OPTIONS ARE WORKED OUT # FIXTHIS

    f.inputs "Dining Info" do
      f.input :gratuity
      f.input :required_deposit
      f.input :admin_fee
      f.inputs do
        f.has_many :restaurant_space_options, heading: "Space Options Info" do |cf|
          cf.input :space_option
          #  What is this doing? The point is to give the option to either select a space_option or create a new one # FIXTHIS
          # cf.object.build_space_option # Needed to create the new instance
          # cf.semantic_fields_for :space_option do |ccf|
          #   ccf.input :space_option
          # end
          cf.input :minimum_spend
          cf.input :number_of_seats
        end
      end
    end

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

      table_for restaurant.restaurant_space_options do
        column(:space_option) { |restaurant_space_option| restaurant_space_option.space_option.space_option }
        column(:number_of_seats) { |restaurant_space_option| restaurant_space_option.number_of_seats }
        column(:minimum_spend) { |restaurant_space_option| restaurant_space_option.minimum_spend }
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
