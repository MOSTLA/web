class CreateTendencia < ActiveRecord::Migration[5.2]
  def change
    create_table :tendencia do |t|
      t.string :nombre
      t.string :abreviacion
      t.string :imagen

      t.timestamps
    end
  end
end
