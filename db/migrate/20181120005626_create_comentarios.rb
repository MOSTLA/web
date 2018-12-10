class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.string :matricula
      t.text :comentario

      t.belongs_to :proyecto, index: true
      t.timestamps
    end
  end
end
