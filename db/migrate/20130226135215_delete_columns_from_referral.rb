class DeleteColumnsFromReferral < ActiveRecord::Migration
  def up
  	remove_column :referrals, :preferred_contact
  	remove_column :referrals, :urgency
  	remove_column :referrals, :contact_by
  	remove_column :referrals, :card_given
  	remove_column :referrals, :email
  	remove_column :referrals, :phone1
  	remove_column :referrals, :phone2
  	remove_column :referrals, :first_name
  	remove_column :referrals, :last_name
  	
  end

  def down
  end
end


