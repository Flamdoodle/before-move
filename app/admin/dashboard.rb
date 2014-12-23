ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
  # div class: "blank_slate_container", id: "dashboard_default_message" do
  #   span class: "blank_slate" do
  #     span I18n.t("active_admin.dashboard_welcome.welcome")
  #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #   end
  # end

    columns do
      column do
        panel "Important Info" do
          table_for User do
            column("New Members Today") { User.where(["created_at >= ? AND created_at <= ?", Time.now.beginning_of_day, Time.now]).count }
          end

          table_for Inquery do
            column("Invites Sent Today") { Inquery.where(["invite_sent_date >= ? AND invite_sent_date <= ?", Time.now.beginning_of_day, Time.now]).count }
          end

          table_for Inquery do
            column("Interested Submissions") { Inquery.where(invite_sent_date: nil).count}
          end

          table_for Booking do
            column("Tickets Sold Today") { Booking.where(["created_at >= ? AND created_at <= ?", Time.now.beginning_of_day, Time.now]).count }
          end
        end

        panel "Upcoming Events" do
          table_for Event do
            column("Events Today") { Event.where(["date >= ? AND date <= ?", Time.now.beginning_of_day, Time.now]).count }
          end

          table_for Event do
            column("Events Tomorrow") { Event.where(["date >= ? AND date <= ?", (Time.now + 1.day).beginning_of_day, (Time.now + 1.day)]).count }
          end
        end

        panel "Past Due Users" do
          # User.where(active_status: false)
        end
      end

      column do
        panel "Last 100 Logins" do
          table_for User.order('last_login desc').limit(100) do |member|
            column("Name") {|member| "#{member.first_name} #{member.last_name} (#{member.last_login})"}
          end
        end
      end

      column do
        panel "Latest Invites" do
          table_for Inquery.all.order('invite_sent_date desc').limit(50) do |inquery|
            column("To:") {|inquery| inquery.name}
            column("From:") {|inquery| User.find_by(referral_code: inquery.referral_code).email}
          end
        end
      end
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
