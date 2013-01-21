class AddContactByToReferral < ActiveRecord::Migration
  def change
    add_column :referrals, :contact_by, :date
  end
end
