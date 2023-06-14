class AddUrlContentToExercices < ActiveRecord::Migration[7.0]
  def change
    add_column :exercices, :url_content, :string
  end
end
