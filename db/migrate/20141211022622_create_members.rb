class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone_number
      t.decimal :dining_credit
      t.integer :taste_points
      t.string :referral_code
      t.integer :membership_cost
      t.boolean :is_admin?, default: false, null: false
      t.boolean :is_active?, default: true, null: false
      t.datetime :last_login
      t.string :code_used_at_signup
      t.string :facebook_token
      t.datetime :facebook_token_expires_at

      t.timestamps
    end
  end
end
