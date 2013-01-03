class AddColumnsToReferral < ActiveRecord::Migration
  def change
    add_column :referrals, :first_name, :string
    add_column :referrals, :last_name, :string
    add_column :referrals, :email, :string
    add_column :referrals, :phone1, :string
    add_column :referrals, :phone2, :string
    add_column :referrals, :address1, :string
    add_column :referrals, :address2, :string
    add_column :referrals, :city, :string
    add_column :referrals, :state, :string
  end
end
