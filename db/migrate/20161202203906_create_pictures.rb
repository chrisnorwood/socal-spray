class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :puzzles do |t|
      t.string :name
      t.string :image_url
      t.integer :solution_x
      t.integer :solution_y
      t.timestamps
    end
  end
end
