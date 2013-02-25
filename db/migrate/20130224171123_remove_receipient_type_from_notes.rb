class RemoveReceipientTypeFromNotes < ActiveRecord::Migration
  def up
  	remove_column :notes, :recipient_type
  end

  def down
  	add_column :notes, :recipient_type, :integer
  end
end
