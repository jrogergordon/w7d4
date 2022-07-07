class Cheers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :cheer
  end
end
