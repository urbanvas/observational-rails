class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|

      t.timestamps
    end
  end
end
