class AddRemoteUrlField < ActiveRecord::Migration
  def change
    add_column :avatars, :remote_picture, :string 
  end
end
