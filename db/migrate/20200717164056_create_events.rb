class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.time :date
      t.string :location
      t.belongs_to :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
