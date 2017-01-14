class DropPuzzles < ActiveRecord::Migration[5.0]
  def change
    drop_table :puzzles
  end
end
