class AddTargetIdToLead < ActiveRecord::Migration
  def change
    add_column :leads, :target_id, :integer
  end
end
