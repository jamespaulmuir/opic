class AddRemoteField < ActiveRecord::Migration
  def change 
    add_column :avatars, :remote_picture_url, :string
  end
end
