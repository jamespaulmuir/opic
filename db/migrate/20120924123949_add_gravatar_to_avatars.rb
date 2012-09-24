class AddGravatarToAvatars < ActiveRecord::Migration
  def change
    add_column :avatars, :gravatar, :boolean
  end
end
