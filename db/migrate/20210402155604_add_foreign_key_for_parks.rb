class AddForeignKeyForParks < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :parks, :states
  end
end
