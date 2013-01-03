class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :written_note
      t.references :referral

      t.timestamps
    end
  end
end
