ActiveAdmin.register Inquery do
  index do
    column(:name)
    column(:email)
    column(:referral_source)
    column(:zipcode)
    column(:referred_by) do |inquery|
      referred_by = Member.find_by(referral_code: inquery.referral_code)
      if referred_by
        link_to(referred_by.name, admin_member_path(referred_by))
      else
        referred_by ||= PromoCode.find_by(code: inquery.referral_code)
        if referred_by
          "#{referred_by.source}"
        end
      end
    end
    column(:created_at)
  end
end
