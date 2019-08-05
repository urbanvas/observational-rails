class CreateGalaxies < ActiveRecord::Migration[5.2]
  def change
    create_table :galaxies do |t|
      t.string :name
      t.boolean :life
      t.string :classification
      t.string :color 
      t.timestamps
    end
  end
end
