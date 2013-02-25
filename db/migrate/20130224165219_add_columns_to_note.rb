class AddColumnsToNote < ActiveRecord::Migration
  def change
    add_column :notes, :recipient_type, :integer
    add_column :notes, :card_given, :boolean
    add_column :notes, :comments, :text
    add_column :notes, :preferred_contact, :string
    add_column :notes, :contact_by, :date
    add_column :notes, :warm_up_by, :date
  end
end
