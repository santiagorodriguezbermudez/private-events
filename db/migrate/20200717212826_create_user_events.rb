class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.belongs_to :attendee, foreign_key: { to_table: :users }
      t.belongs_to :attended_event, foreign_key: { to_table: :events }

      t.timestamps
    end
  end
end
