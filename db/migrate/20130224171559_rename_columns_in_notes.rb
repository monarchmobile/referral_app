class RenameColumnsInNotes < ActiveRecord::Migration
  def up
  	rename_column :notes, :comments, :t_comments
  	rename_column :notes, :card_given, :t_card_given
  	rename_column :notes, :preferred_contact, :t_preferred_contact
  	add_column :notes, :t_urgency, :string
  	add_column :notes, :r_urgency, :string
  end

  def down
  end
end
