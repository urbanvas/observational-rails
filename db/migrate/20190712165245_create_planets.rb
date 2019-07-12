class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.belongs_to :observation
      t.belongs_to :system
    end
  end
end
