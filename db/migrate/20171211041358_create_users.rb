class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.string :email, null: false, unique: true, index: true
    end
  end
end
