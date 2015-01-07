ActiveAdmin.register User, as: "Member" do
  show do
    panel "Basic Info" do
      attributes_table_for member do
        row :address
        row :email
        row :phone_number
      end
    end

    panel "Membership Info" do
      attributes_table_for member do
        row :member_since do
          member.created_at
        end
        row :membership_fee do
          member.membership_cost
        end
        row :membership_origin do
          # if from inquery
          # elsif from invitiation
          # elsif from guest
          # elsif from promo code
          # else nothing
        end
        row :membership_status do
          if member.is_active?
            "Active"
          else
            "Unsubscribed"
          end # FIXTHIS what does Recurly tell us? How do we let them continue accessing the site until their membership is expired?
        end
      end
    end

    panel "Payment Info" do
      # FIXTHIS
    end

    panel "Event Activity" do
      attributes_table_for member do
        row :total_events do
          member.events.count
        end
        row :upcoming_events do
          member.events.where(["date > ?", Time.now]).count
        end
        row :past_events do
          member.events.where(["date <= ?", Time.now]).count
        end
      end

      tabs do
        tab "Upcoming Events - #{member.events.where("date > ?", Time.now).count}" do
          table_for member.events.where(["date > ?", Time.now]) do
            column(:restaurant) do |event|
              link_to(event.restaurant.name, admin_restaurant_path(event.restaurant))
            end
            column("Date/Time") do |event|
              link_to("#{event.date} at #{event.time.strftime("%l:%M%p")}", admin_event_path(event))
            end
            column("Tickets") do |event|
              event.bookings.find_by(user: member).number_of_tickets
            end
            column("Price") do |event|
              "$#{event.seat_cost}"
            end
          end
        end

        tab "Past Events - #{member.events.where("date <= ?", Time.now).count}" do
          table_for member.events.where(["date <= ?", Time.now]) do
            column(:restaurant) do |event|
              link_to(event.restaurant.name, admin_restaurant_path(event.restaurant))
            end
            column("Date/Time") do |event|
              link_to("#{event.date} at #{event.time.strftime("%l:%M%p")}", admin_event_path(event))
            end
            column("Tickets") do |event|
              event.bookings.find_by(user: member).number_of_tickets
            end
            column("Price") do |event|
              "$#{event.seat_cost}"
            end
          end
        end
      end
    end

    panel "Referrals" do
      # FIXTHIS
    end

    panel "TastePoints" do
      # FIXTHIS
    end
  end
end
