class AddWarmUpByToReferral < ActiveRecord::Migration
  def change
    add_column :referrals, :warm_up_by, :date
  end
end
