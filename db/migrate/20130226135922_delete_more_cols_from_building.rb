class DeleteMoreColsFromBuilding < ActiveRecord::Migration
  def up
  	remove_column :referrals, :address1
  	remove_column :referrals, :address2
  	remove_column :referrals, :city
  	remove_column :referrals, :state
  end

  def down
  end
end
