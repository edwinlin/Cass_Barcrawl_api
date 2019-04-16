class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.integer :event_id
      t.integer :event_order
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
