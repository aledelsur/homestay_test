class AddIndexesToTables < ActiveRecord::Migration
  def change
  	add_index :room_reservations, :room_ref
  	add_index :rooms, :host_ref
  end
end
