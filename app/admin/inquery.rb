ActiveAdmin.register Inquery do
  index do
    column(:name)
    column(:email)
    column(:referral_source)
    column(:zipcode)
    column(:referred_by) do |inquery|
      referred_by = Member.find_by(referral_code: inquery.referral_code)
      return link_to(referred_by.name, admin_member_path(referred_by)) if referred_by
      referred_by ||= PromoCode.find_by(code: inquery.referral_code)
      return "#{referred_by.source}" if referred_by
    end
    column(:created_at)
  end
end
