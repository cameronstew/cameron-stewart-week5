class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.date :date
      t.boolean :requires_id
      t.integer :location_id
    end
  end
end
