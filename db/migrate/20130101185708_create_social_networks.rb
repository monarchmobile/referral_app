class CreateSocialNetworks < ActiveRecord::Migration
  def change
    create_table :social_networks do |t|
      t.string :network_name
      t.string :acct_name
      t.references :user

      t.timestamps
    end
  end
end
