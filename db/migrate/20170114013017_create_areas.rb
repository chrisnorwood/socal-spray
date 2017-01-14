class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :parent_id

      t.timestamps
    end

    add_index :areas, :parent_id
  end
end
