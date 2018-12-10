class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :name
      t.string :email
      t.boolean :admin
      t.string :password_digest
      t.string :remember_digest
      t.timestamps
    end
  end
end
