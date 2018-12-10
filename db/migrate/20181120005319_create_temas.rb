class CreateTemas < ActiveRecord::Migration[5.2]
  def change
    create_table :temas do |t|
      t.string :nombre
      t.string :fotos, array: true, default: "[]"

      t.timestamps
    end
  end
end
