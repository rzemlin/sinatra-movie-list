class CreateMovieEntries < ActiveRecord::Migration[4.2]
  def change
    create_table :movie_entries do |t|
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
