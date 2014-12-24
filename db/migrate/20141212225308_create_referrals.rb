class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.belongs_to :user
      t.string :referral_type
      t.string :name_of_referred
      t.string :email_of_referred

      t.timestamps
    end
  end
end
