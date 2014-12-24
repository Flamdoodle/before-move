ActiveAdmin.register Restaurant do
  permit_params :name, :street_address, :zipcode, :city_id, :neighborhood, :cuisine_type, :description, :gratuity,
    contacts_attributes: [:id, :name, :title, :email, :phone_number, :is_primary?],
    experiences_attributes: [:id, :space_option, :minimum_spend, dining_options_attributes: [:id, :admin_fee, :required_deposit, :number_of_seats]],
    dining_options_attributes: [:id, :admin_fee, :required_deposit, :number_of_seats],
    accolades_attributes: [:id, :name],
    awardings_attributes: [:id]

    form do |f|
      f.inputs "Basic Info" do
        f.input :name
        f.input :street_address
        f.input :city
        f.input :zipcode
        f.input :neighborhood
        f.input :cuisine_type
        f.input :gratuity
        f.input :description
        f.inputs do
          f.has_many :accolades, heading: "Add Accolades" do |cf|
            cf.input :name
          end
        end
      end


      f.inputs "Dining Info" do
        f.has_many :experiences, heading: false do |cf|
          cf.input :space_option
          cf.input :minimum_spend
          cf.has_many :dining_options, heading: "Option Info" do |ccf|
            ccf.input :required_deposit
            ccf.input :admin_fee
            ccf.input :number_of_seats
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

    # show do
    #   panel "Basic Info" do
    #     attributes_table_for event do
    #       row :seat_cost, as: "Ticket Price"
    #       row :gratuity, as: "Gratuity"
    #       row :max_tickets_per_member
    #     end
    #   end

    #   panel "Menu Info" do
    #     attributes_table_for event.menus do
    #       row :name
    #       row :description
    #       row :number_of_courses
    #     end

    #     table_for event.menus do
    #       column("First Course") do |menu|
    #         attributes_table_for menu.menu_items.where(course_number: 1) do
    #           row :name
    #           row :description
    #         end
    #       end
    #     end

    #     table_for event.menus do
    #       column("Second Course") do |menu|
    #         attributes_table_for menu.menu_items.where(course_number: 2) do
    #           row :name
    #           row :description
    #         end
    #       end
    #     end

    #     table_for event.menus do
    #       column("Third Course") do |menu|
    #         attributes_table_for menu.menu_items.where(course_number: 3) do
    #           row :name
    #           row :description
    #         end
    #       end
    #     end
    #   end
    # end


end
