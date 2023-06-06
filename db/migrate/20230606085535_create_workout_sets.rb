class CreateWorkoutSets < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_sets do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :exercice, null: false, foreign_key: true
      t.integer :flexibility
      t.integer :muscular_effort
      t.integer :breath_difficulty
      t.integer :repetition

      t.timestamps
    end
  end
end
