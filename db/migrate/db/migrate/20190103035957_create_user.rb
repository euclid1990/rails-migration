class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 50, null: false
      t.date :birthday
      t.string :password
      t.datetime :signed_in_at
      t.datetime :signed_out_at
      t.timestamps
    end
  end
end
