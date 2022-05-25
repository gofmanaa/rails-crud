class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username,  null: false
      t.string :email, limit: 50, null: false
      t.string :password
      t.string :password_digest
      t.string :password_confirmation
      t.string :psw

      t.timestamps
    end
  end
end
