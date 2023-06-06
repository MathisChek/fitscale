class CreateExercices < ActiveRecord::Migration[7.0]
  def change
    create_table :exercices do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
