class AddServiceIdToAvatars < ActiveRecord::Migration
  def change
    add_column :avatars, :service_id, :integer
    add_index :avatars, :service_id
  end
end
