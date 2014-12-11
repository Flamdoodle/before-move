class CreateInqueries < ActiveRecord::Migration
  def change
    create_table :inqueries do |t|
      t.string :name
      t.string :email
      t.string :referral_source
      t.string :zipcode
      t.string :referral_code

      t.timestamps
    end
  end
end
