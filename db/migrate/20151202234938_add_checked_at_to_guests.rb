class AddCheckedAtToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :checked_at, :timestamp
  end
end
