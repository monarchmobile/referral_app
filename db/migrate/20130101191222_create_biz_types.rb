class CreateBizTypes < ActiveRecord::Migration
  def change
    create_table :biz_types do |t|
      t.string :category
      t.integer :code

      t.timestamps
    end
  end
end
