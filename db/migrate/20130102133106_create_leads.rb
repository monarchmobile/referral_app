class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.integer :referrer_id
      t.integer :referee_id
      t.integer :referral_id

      t.timestamps
    end
  end
end
