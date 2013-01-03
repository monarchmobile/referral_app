class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.string :type
      t.references :user

      t.timestamps
    end
  end
end
