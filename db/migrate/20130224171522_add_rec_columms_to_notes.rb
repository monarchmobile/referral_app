class AddRecColummsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :r_contact_by, :date
    add_column :notes, :r_comments, :text
    add_column :notes, :r_card_given, :boolean
    add_column :notes, :r_preferred_contact, :string
  end
end
