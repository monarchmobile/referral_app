class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :urgency
      t.string :string
      t.date :date_submitted
      t.boolean :inside
      t.boolean :card_given
      t.string :preferred_contact
      t.text :comments

      t.timestamps
    end
  end
end
