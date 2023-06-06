class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.date :programing_at
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
