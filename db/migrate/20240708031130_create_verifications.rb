class CreateVerifications < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :verified, :boolean, default: false

    create_table :verifications do |t|  
      t.string :verification_code, null: false
      t.boolean :active, default: true
      t.datetime :expires_at
      t.datetime :verified_at

      t.timestamps
    end
    
    add_reference :verifications, :user, index: true
  end
end
