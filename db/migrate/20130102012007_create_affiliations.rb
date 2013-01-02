class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.string :aff_name
      t.string :chapter
      t.references :user

      t.timestamps
    end
  end
end
