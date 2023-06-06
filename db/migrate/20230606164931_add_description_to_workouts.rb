class AddDescriptionToWorkouts < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :description, :string
  end
end
