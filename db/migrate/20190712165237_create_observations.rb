class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations do |t|
      t.string :name
      t.belongs_to :user
    end
  end
end
