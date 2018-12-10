class CreatePpts < ActiveRecord::Migration[5.2]
  def change
    create_table :ppts do |t|
      t.string :imagen
      t.integer :posicion

      t.belongs_to :tema, index: true
      t.timestamps
    end
  end
end
