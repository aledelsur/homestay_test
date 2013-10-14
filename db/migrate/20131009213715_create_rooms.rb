class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
    	t.string		:ref
    	t.string		:host_ref
    	t.integer		:capacity

      t.timestamps
    end
  end
end
