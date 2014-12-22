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
          # Important info here
        end

        panel "Upcoming Events" do
          # Upcoming events here
        end

        panel "Past Due Users" do
          # User.where(active_status: false)
        end
      end

      column do
        panel "Last 100 Logins" do
          # Last 100 logins
      end
    end

      column do
        panel "Latest Invites" do
          table_for Inquery.all.order('invite_sent_date desc') do |inquery|
            column("To:") {|inquery| inquery.name}
            column("From:") #{|inquery| link_to(User.find(referral_code: inquery.referral_code))}
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
