class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string "email"
      t.string "username"
      t.string "first_name"
      t.string "last_name"
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at", precision: nil
      t.datetime "remember_created_at", precision: nil
      t.integer "sign_in_count"
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string "current_sign_in_ip"
      t.string "last_sign_in_ip"
      t.timestamps
    end

    create_table :request_logs do |t|
      t.integer :user_id
      t.integer :timestamp
      t.string :ip_address
      t.string :action
      
      t.timestamps
    end

    create_table :blocked_ip_addresses do |t|
      t.string :ip_address, null: false
      t.string :reason
      
      t.timestamps
    end
  end
end
