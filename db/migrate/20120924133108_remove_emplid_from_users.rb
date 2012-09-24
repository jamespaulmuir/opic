class RemoveEmplidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :emplid
  end
end
