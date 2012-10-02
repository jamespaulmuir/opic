class AddHashToUser < ActiveRecord::Migration
  def change
    add_column :users, :hashed_name_n, :string
    add_index :users, :hashed_name_n
    User.reset_column_information
    User.find_each do |user|
      user.send(:hash_the_name_n)
      user.save!
    end
  end
end
