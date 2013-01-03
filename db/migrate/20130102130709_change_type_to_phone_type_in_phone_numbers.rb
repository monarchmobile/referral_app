class ChangeTypeToPhoneTypeInPhoneNumbers < ActiveRecord::Migration
  def up
  	remove_column :phone_numbers, :type
  	add_column :phone_numbers, :phone_type, :string
  end

  def down
  end
end
