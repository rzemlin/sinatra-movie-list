class CreateMovieEntries < ActiveRecord::Migration
  def change
    create_table :movie_entries do |t|

      t.timestamps null: false
    end
  end
end
