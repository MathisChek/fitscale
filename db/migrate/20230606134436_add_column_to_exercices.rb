class AddColumnToExercices < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.string :muscle
      t.string :equipment, null: "none", default: "none"
      t.string :instructions

      t.timestamps
    end
  end
end
