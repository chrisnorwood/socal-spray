class AddSlugToArea < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :slug, :string
    add_index :areas, :slug, unique: true
  end
end
