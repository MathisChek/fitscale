class AddColumnsToExercices < ActiveRecord::Migration[7.0]
  def change
    add_column :exercices, :name, :string
    add_column :exercices, :type, :string
    add_column :exercices, :muscle, :string
    add_column :exercices, :equipment, :string
    add_column :exercices, :instructions, :string
  end
end
