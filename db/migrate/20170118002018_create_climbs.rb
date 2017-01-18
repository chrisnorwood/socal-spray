class CreateClimbs < ActiveRecord::Migration[5.0]
  def change
    create_table :climbs do |t|
      t.string :name
      t.string :grade
      t.text :fa
      t.text :description
      t.string :location
      t.references :user, foreign_key: true, index: true
      t.references :area, foreign_key: true, index: true

      t.timestamps
    end
  end
end
