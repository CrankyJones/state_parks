class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string  :name
      t.string  :description
      t.integer :state_id
    end
  end
end
