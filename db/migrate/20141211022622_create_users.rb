class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password # update this
      t.string :address
      t.string :zipcode
      t.string :phone_number
      t.decimal :dining_credit
      t.integer :taste_points
      t.string :referral_code
      t.integer :membership_cost
      t.boolean :is_admin?
      t.boolean :is_active?
      t.date :last_login

      t.timestamps
    end
  end
end
