class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.string :auth_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :biz_type
      t.string :website

      t.timestamps
    end
  end
end
