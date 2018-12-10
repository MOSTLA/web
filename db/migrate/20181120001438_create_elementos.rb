class CreateElementos < ActiveRecord::Migration[5.2]
  def change
    create_table :elementos do |t|
      t.string :nombre
      t.string :link
      t.string :foto
      t.text :descripcion
      
      t.belongs_to :tendencia, index: true
      t.timestamps
    end
  end
end
