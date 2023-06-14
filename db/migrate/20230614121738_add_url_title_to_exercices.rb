class AddUrlTitleToExercices < ActiveRecord::Migration[7.0]
  def change
    add_column :exercices, :url_title, :string
  end
end
