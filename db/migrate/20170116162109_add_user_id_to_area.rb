class AddUserIdToArea < ActiveRecord::Migration[5.0]
  def change
    add_reference :areas, :user, index: true
  end
end
