class AddLocationQueryToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :location_query, :string
  end
end
