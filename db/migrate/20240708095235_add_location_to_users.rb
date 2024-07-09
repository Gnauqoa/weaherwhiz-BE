class AddLocationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :location_id, :bigint
    add_column :users, :notification_each_day, :boolean
  end
end
