class AddBizTypeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :biz_type_id, :integer
  end
end
