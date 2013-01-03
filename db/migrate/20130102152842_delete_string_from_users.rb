class DeleteStringFromUsers < ActiveRecord::Migration
  def up
  	remove_column :referrals, :string
  end

  def down
  end
end
