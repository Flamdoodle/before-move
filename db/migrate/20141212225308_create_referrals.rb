class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.belongs_to :user
      t.string :type

      t.timestamps
    end
  end
end
