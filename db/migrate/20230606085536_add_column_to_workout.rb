class AddColumnToWorkout < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :name, :string
    add_column :workouts, :descrption, :text
  end
end
