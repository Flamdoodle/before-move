ActiveAdmin.register PromoCode do
  form do |f|
    f.inputs "Promo Code Info" do
      f.input :code
      f.input :expiration_date, as: :date_picker
      f.input :membership_price
    end

    f.actions
  end
end
