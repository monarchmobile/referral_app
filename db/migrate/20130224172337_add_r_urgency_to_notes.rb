class AddRUrgencyToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :r_urgency, :string
  end
end
