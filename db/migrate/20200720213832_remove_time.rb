class RemoveTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :date, :time
    add_column :events, :date, :date
  end
end
