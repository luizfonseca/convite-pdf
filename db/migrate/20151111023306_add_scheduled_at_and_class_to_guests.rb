class AddScheduledAtAndClassToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :scheduled_at, :timestamp
    add_column :guests, :group, :string
  end
end
