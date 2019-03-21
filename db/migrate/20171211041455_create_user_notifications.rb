class CreateUserNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :user_notifications do |t|
      t.timestamps null: false
      t.string :endpoint, null: false
      t.string :p256dh_key, null: false
      t.string :auth_key, null: false
    end
  end
end
