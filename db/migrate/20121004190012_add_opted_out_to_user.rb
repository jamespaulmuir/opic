class AddOptedOutToUser < ActiveRecord::Migration
  def change
    add_column :users, :opted_out, :boolean, :default => false
  end
end
