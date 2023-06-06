class ChangeColumnToWorkout < ActiveRecord::Migration[7.0]
  def change
    remove_column :workouts, :descrption, :text
    add_column :workouts, :description, :text
  end
end
