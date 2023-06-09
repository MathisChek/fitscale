class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exercice, null: false, foreign_key: true
      t.integer :flexibility
      t.integer :muscular_effort
      t.integer :breath_difficulty

      t.timestamps
    end
  end
end
