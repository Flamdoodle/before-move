class CreatePromoCodes < ActiveRecord::Migration
  def change
    create_table :promo_codes do |t|
      t.string :code
      t.date :expiration_date
      t.decimal :membership_price
      t.string :source
      t.string :description
      t.string :email_message
      t.boolean :is_active?

      t.timestamps
    end
  end
end
