class AddColumnToExercices < ActiveRecord::Migration[7.0]
  def change
    add_column :name
    add_column :type
    add_column :muscle
    add_column :equipment, null: "none", default: "none"
    add_column :instructions
    end
  end
end
