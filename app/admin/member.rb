ActiveAdmin.register Member do
  scope("Active") { |scope| scope.where(is_active?: true) }
  scope("Past Due") { |scope| scope.where(is_active?: false)}

  filter :name
  filter :city
  filter :state
  filter :zipcode
  filter :membership_fee
  filter :tastepoints
  filter :number_of_members_referred
  filter :referred_by
  filter :dining_credit
  filter :created_at, as: :date_range, label: "Join Date"

  index do
    column(:name) do |member|
      link_to(member.name, admin_member_path(member))
    end
    column(:city)
    column(:zipcode)
    column(:referred_by) do |member|
      referred_by = Member.find_by(referral_code: member.code_used_at_signup)
      if referred_by
        "Referred by: " + link_to(referred_by.name, admin_member_path(referred_by))
      else
        referred_by ||= PromoCode.find_by(code: member.code_used_at_signup)
        if referred_by
          "Referred by: #{referred_by.source}"
        end
      end
    end
    column(:tastepoints)
    column("Number of Member Referrals") do |member|
      Member.where(code_used_at_signup: member.referral_code).count
    end
    column(:join_date) do |member|
      member.created_at.strftime("%B %-d, %Y")
    end
    column(:events_booked) do |member|
      member.bookings.count
    end
  end

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
              event.bookings.find_by(member: member).number_of_tickets
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
              event.bookings.find_by(member: member).number_of_tickets
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
