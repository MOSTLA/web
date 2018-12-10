class CreateArticulos < ActiveRecord::Migration[5.2]
  def change
    create_table :articulos do |t|
      t.string :nombre
      t.string :propietario
      t.string :imagen
      t.text :descripcion
      t.boolean :pedido, default: false
      t.boolean :rentado, default: false
      t.float :precio, default: 0
      t.string :ultimoPedido
      t.datetime :fechaPedido

      t.belongs_to :elemento, index: true
      t.timestamps
    end
  end
end
