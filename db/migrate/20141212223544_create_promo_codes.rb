class CreatePromoCodes < ActiveRecord::Migration
  def change
    create_table :promo_codes do |t|
      t.string :code
      t.date :expiration_date
      t.decimal :membership_price

      t.timestamps
    end
  end
end
