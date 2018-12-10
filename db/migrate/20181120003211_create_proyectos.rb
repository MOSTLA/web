class CreateProyectos < ActiveRecord::Migration[5.2]
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.text :contactos
      t.string :imagen
      t.text :descripcion
      t.boolean :aprovado, default:false
      t.boolean :porRevisar, default: false
      t.text :comentario

      t.belongs_to :usuario, index: true
      t.timestamps
    end
  end
end
