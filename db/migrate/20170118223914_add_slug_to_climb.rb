class AddSlugToClimb < ActiveRecord::Migration[5.0]
  def change
    add_column :climbs, :slug, :string
    add_index :climbs, :slug, unique: true
  end
end
