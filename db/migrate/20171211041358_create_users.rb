class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :name
      t.references :user_notification, null: false
      t.string :auth_key, null: false
    end
  end
end
